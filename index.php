<?php

require_once("models/Database.php");
require_once("models/Model.php");
require_once("views/View.php");
require_once("./controllers/Controller.php");
require_once("./controllers/AdminController.php");

$database = new Database("webshop", "root", "root");
$model = new Model($database);
$view = new View();
$adminController = new AdminController($model, $view);
$controller = new Controller($model, $view, $adminController);

$controller->main();
