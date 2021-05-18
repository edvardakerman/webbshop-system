<?php

class Controller
{

    private $model;
    private $view;

    public function __construct($model, $view)
    {
        $this->model = $model;
        $this->view = $view;
    }

    public function main()
    {
        $this->router();
    }
    private function router()
    {
        $page = $_GET['page'] ?? "";

        switch ($page) {
            case "about":
                $this->about();
                break;
            case "order":
                $this->detailPage();
                break;
            case "register":
                $this->register();
                break;
            case "login":
                $this->login();
                break;
            case "loginadmin":
                $this->loginadmin();
                break;
            case "logout":
                $this->view->logoutPage();
                break;
            case "shoppingcart":
                $this->cartPage();
                break;
            default:
                $this->getAllCards();
        }
    }

    private function getHeader($title)
    {
        $this->view->viewHeader($title);
    }

    private function getFooter()
    {
        $this->view->viewFooter();
    }

    private function about()
    {
        $this->getHeader("About us");
        $this->view->viewAboutPage();
        $this->getFooter();
    }

    private function cartPage()
    {
        $this->getHeader("Your Shoppingcart");
        $this->view->viewCartPage();

        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['sendOrder']))
            $this->sendOrderToDb();

        $this->getFooter();
    }

    private function register()
    {
        $this->getHeader("register");
        $this->view->registerPage();

        if ($_SERVER['REQUEST_METHOD'] === 'POST')
            $this->registerUserToDb();
        $this->getFooter();
    }

    private function login()
    {
        $this->getHeader("login");
        $this->view->loginPage();

        if ($_SERVER['REQUEST_METHOD'] === 'POST')
            $this->validateUserLogin();

        $this->getFooter();
    }

    private function loginadmin()
    {
        $this->getHeader("login admin");
        $this->view->loginAdminPage();

        if ($_SERVER['REQUEST_METHOD'] === 'POST')
            $this->validateUserLogin();

        $this->getFooter();
    }

    private function getAllCards()
    {
        $this->getHeader("Welcome");
        $cards = $this->model->fetchAllCards();
        $this->view->viewAllCards($cards);
        $this->getFooter();
    }

    private function detailPage()
    {
        $this->getHeader("Beställning");

        $id = $this->sanitize($_GET['id']);
        $card = $this->model->fetchCardById($id);

        if ($card)
            $this->view->viewOrderPage($card);

        // Funktion för att beställa mängd antal kort!!
        //
        // if ($_SERVER['REQUEST_METHOD'] === 'POST')
        //     $this->registerUserToDb();

        $this->getFooter();
    }


    private function sendOrderToDb()
    {

        foreach ($_SESSION['order'] as $order) {

            $id = $this->sanitize($order['id']);
            $amount = $this->sanitize($order['amount']);
            $price = $this->sanitize($order['price']);
            $confirmed = $this->model->sendOrderToDb($id, $amount, $price);
        }

        // if ($confirmed) {
        //     $this->view->viewConfirmMessageSend($_SESSION['email']);
        // } else {
        //     $this->view->viewErrorMessage();
        // }
    }


    private function registerUserToDb()
    {
        $CustomerFirstname    = $this->sanitize($_POST['firstname']);
        $CustomerLastname = $this->sanitize($_POST['lastname']);
        $CustomerEmail = $this->sanitize($_POST['email']);
        $CustomerPassword = $this->sanitize($_POST['password']);
        $confirmed = $this->model->modelRegisterCustomer($CustomerFirstname, $CustomerLastname, $CustomerEmail, $CustomerPassword);

        if ($confirmed) {
            $this->view->viewConfirmMessageRegister($CustomerFirstname);
        } else {
            $this->view->viewErrorMessage();
        }
    }

    public function validateUserLogin()
    {
        $CustomerEmail = $this->sanitize($_POST['email']);
        $CustomerPassword = $this->sanitize($_POST['password']);

        $confirmed = $this->model->modelLoginCustomer($CustomerEmail, $CustomerPassword);

        if ($confirmed) {
            $this->view->viewConfirmMessageLogin($CustomerEmail . "... redirecting to homepage");
            header("refresh:1; url=index.php");
        } else {
            $this->view->viewErrorMessage($CustomerEmail);
        }
    }

    /**
     * Sanitize Inputs
     * https://www.w3schools.com/php/php_form_validation.asp
     */
    public function sanitize($text)
    {
        $text = trim($text);
        $text = stripslashes($text);
        $text = htmlspecialchars($text);
        return $text;
    }
}
