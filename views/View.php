<?php

class View
{

    /*********************
     * Includes
     */
    public function viewHeader($title)
    {
        include_once("views/include/header.php");
    }

    public function viewFooter()
    {
        include_once("views/include/footer.php");
    }

    public function viewAboutPage()
    {
        include_once("views/include/about.php");
    }

    public function viewCustomerPage($orders)
    {
        include_once("views/include/customerPage.php");
    }

    public function registerPage()
    {
        include_once("views/include/register.php");
    }
    public function loginPage()
    {
        include_once("views/include/login.php");
    }

    public function logOut()
    {
        include_once("views/include/logout.php");
    }

    public function viewAdminOrderPage()
    {
        include_once("views/include/admin/adminOrderPage.php");
    }

    public function viewAdminProductPage()
    {
        include_once("views/include/admin/adminProductPage.php");
    }

    public function viewAdminDeletePage($cards)
    {
        include_once("views/include/admin/adminDeletePage.php");
    }

    public function viewAdminCreatePage()
    {
        include_once("views/include/admin/adminCreatePage.php");
    }

    public function viewAdminUpdatePage($cards)
    {
        include_once("views/include/admin/adminUpdatePage.php");
    }

    public function viewAdminUpdateDetailPage($cards)
    {
        include_once("views/include/admin/adminUpdateDetailPage.php");
    }

    public function viewOrderConfirmPage()
    {
        include_once("views/include/orderconfirm.php");
    }

    public function viewCartPage()
    {
        include_once("views/include/shoppingcart.php");
    }

    public function viewOrderDetailPage($orders)
    {
        include_once("views/include/orderdetailpage.php");
    }

    /***********************
     * Page Functions
     */
    public function viewCardDetailPage($card)
    {
        $this->viewOneCard($card);
        $this->viewCardDetails($card);
    }

    public function viewAllCards($cards)
    {
        foreach ($cards as $card) {
            $this->viewOneCard($card);
        }
    }

    private function viewOneCard($card)
    {
        if (isset($_GET['page']) && $_GET['page'] === 'detailpage') {
            $bootstrap = "col-md-5 mx-auto";
        } else {
            $bootstrap = "col-md-4";
        }

        $html = <<<HTML
        
        <div class=$bootstrap>
            <a href="?page=detailpage&id=$card[id]">
                <div class="card m-1">
                    <img class="card-img-top img-thumbnail" 
                        src="$card[image]" alt="$card[name]">
                    <div class="card-body">
                        <div class="card-title text-center">
                            <h5>$card[name]</h5>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        HTML;

        echo $html;
    }

    private function viewCardDetails($card)
    {
        $amountLeft =  $this->updatedTotalCardAmount($card);
        $showbtn = 'enabled';
        $btnText = 'Add card to shopping cart';

        if ($amountLeft == '0') {
            $showbtn = 'disabled';
            $btnText = 'This item is out of stock';
        }

        $html = <<<HTML
        
            <div class="col-md-5 mx-auto">
                <h5 class="mb-2">Select number of cards</h5>
                <form action="?page=shoppingcart" method="post">
                    <input type="hidden" name="id" 
                            value="$card[id]">
                    <input type="hidden" name="title" 
                            value="$card[name]">
                    <input type="hidden" name="check" 
                            value="check">
                    <input type="hidden" name="price" 
                            value="$card[price]">
                    <input type="number" value=1 min=1 max=$amountLeft name="amount" required 
                            class="form-control form-control-lg my-2">
                    <input type="submit" class="form-control my-2 btn btn-lg btn-outline-success" 
                            value="$btnText" $showbtn>
                </form>
                <h2 class="text-center mt-3 mb-4">Price: $$card[price]</h2>
                <div class="card m-1">
                    <div class="card-body">
                        <div class="card-title text-center">
                            <h5>$card[description]</h5>
                            <p>Amount left: $amountLeft</p>
                        </div>
                    </div>
                </div>
            </div>
        HTML;

        echo $html;
    }

    /*************
     * Update card amount, locally with Session
     */
    private function updatedTotalCardAmount($card)
    {
        $updatedAmount = $card['amount'];

        if (isset($_SESSION['order'])) {
            $amountOfOrders = count($_SESSION['order']);
            for ($i = 0; $i < $amountOfOrders; $i++) {

                if ($_SESSION['order'][$i]['id'] === $card['id']) {
                    $updatedAmount = $card['amount'] -= $_SESSION['order'][$i]['amount'];
                }
            }
        }
        return $updatedAmount;
    }

    /*****************************
     * Order Handling Page ADMIN
     */
    public function viewAllOrdersToHandle($ordersToHandle)
    {
        $reversed = array_reverse($ordersToHandle);
        $row = 0;
        foreach ($reversed as $order) {
            $row += 1;
            $this->viewOneOrderToHandle($order, $row);
        }
    }

    private function viewOneOrderToHandle($order, $row)
    {

        if (!$order['orderStatus'] == 1){
        $html = <<<HTML
            <tr>
            <th scope="row">$row</th>
            <td>$order[id]</td>
            <td>$order[customerId]</td>
            <td>$order[RegisterDate]</td>
                <td><form action="#" method="post">
                    <input type="hidden" name="orderId" value="$order[id]">
                    <input type="submit" class="btn btn-primary" value="Send Order">
                </form>
            </td>
            </tr>

        HTML;

        } else {
            $html = <<<HTML
            <tr>
            <th scope="row">$row</th>
            <td>$order[id]</td>
            <td>$order[customerId]</td>
            <td>$order[RegisterDate]</td>
            <td>Order Sent</td>
            </tr>

        HTML;
    
        }
        echo $html;
    }

    /*****************************
     * MESSAGES
     */
    public function viewConfirmMessageSend($userInfo)
    {
        $this->printMessage(
            "<h4 class='text-center'>Thank you! $_SESSION[email]</h4>
            <h4 class='text-center'>Order confirmed!</h4>
            ",
            "success"
        );
    }

    public function viewConfirmMessageSuccess($id, $type)
    {
        $this->printMessage(
            "<h4 class='text-center'>$id was successfully $type</h4>
            ",
            "success"
        );
    }

    public function viewConfirmMessageRegister($userInfo)
    {
        $this->printMessage(
            "<h4>User $userInfo Created, welcome! Please log in.</h4>
            ",
            "success"
        );
    }

    public function viewConfirmMessageLogin($userInfo)
    {
        $this->printMessage(
            "<h4>User $userInfo successfully logged in!</h4>
            ",
            "success"
        );
    }

    public function viewErrorMessage()
    {
        $this->printMessage(
            "<h4>Something went wrong, please double check your email and password.</h4>
            <h4>Contact customer support if error still remains.</h4>
            </div> <!-- col  avslutar Beställningsformulär -->
            ",
            "warning"
        );
    }

    /**
     * En funktion som skriver ut ett felmeddelande
     * $messageType enligt Bootstrap Alerts
     * https://getbootstrap.com/docs/5.0/components/alerts/
     */
    public function printMessage($message, $messageType = "danger")
    {
        $html = <<< HTML
            <div class="my-2 col-md-8 mx-auto alert alert-$messageType">
                $message
            </div>
        HTML;

        echo $html;
    }
}
