<?php
    require_once 'Configuration.php';
    require_once 'vendor/autoload.php';

    ob_start();

    /*require_once('core/DatabaseCofiguration.php');
    /*require_once('core/DatabaseConnection.php');
    require_once('models/UserModel.php');
    require_once('models/CategoryModel.php');
    require_once('controllers/MainController.php');
    require_once('core\Router');
    /*require_once('controllers/ApiAuctionController.php');*/


    use App\Controllers\MainController;
    use App\Controllers\CategoryController;
    use App\Controllers\ApiAuctionController;
    use App\Core\DatabaseConnection;
    use App\Core\DatabaseConfiguration;
    use App\Models\CategoryModel;
    use App\Models\UserModel;
    use App\Core\Router;
    use App\Core\ApiController;

    $databaseConfiguration = new DatabaseConfiguration(
        Configuration::DATABASE_HOST,
        Configuration::DATABASE_USER,
        Configuration::DATABASE_PASS,
        Configuration::DATABASE_NAME
    );
    
    $databaseConnection = new DatabaseConnection($databaseConfiguration);

    $url = strval(filter_input(INPUT_GET, 'URL'));
    $httpMethod = filter_input(INPUT_SERVER, 'REQUEST_METHOD');

    $router = new Router();
    $routes = require_once 'Routes.php';
    foreach ($routes as $route) {
        $router->add($route);
    }

    $route = $router->find($httpMethod, $url);
    $arguments = $route->extractArgument($url);

    /*print_r($route);
    print_r($arguments);
    exit;*/
       
    $fullControllerName = '\\App\\Controllers\\' . $route->getControllerName() . 'Controller';
    $controller = new $fullControllerName($databaseConnection);

    $fingerprintProviderFactoryClass  = Configuration::FINGERPRINT_PROVIDER_FACTORY;
	$fingerprintProviderFactoryMethod = Configuration::FINGERPRINT_PROVIDER_METHOD;
	$fingerprintProviderFactoryArgs   = Configuration::FINGERPRINT_PROVIDER_ARGS;
	$fingerprintProviderFactory = new $fingerprintProviderFactoryClass;
	$fingerprintProvider = $fingerprintProviderFactory->$fingerprintProviderFactoryMethod(...$fingerprintProviderFactoryArgs);

    $sessionStorageClassName = Configuration::SESSION_STORAGE;
    $sessionStorageConstructorArguments = Configuration::SESSION_STORAGE_DATA;
    $sessionStorage = new $sessionStorageClassName(...$sessionStorageConstructorArguments);

    $session = new \App\Core\Session\Session($sessionStorage, Configuration::SESSION_LIFETIME);
    $session->setFingerprintProvider($fingerprintProvider);
    $controller->setSession($session);
    $controller->getSession()->reload();
    $controller->__pre();
    call_user_func_array([$controller, $route->getMethodName()], $arguments);

    $controller->getSession()->save();

    //$methodName = $route->getMethodName();
    //$controller->home();
    $data = $controller->getData();
    
    #foreach($data as $name => $value) {
    #    $$name = $value;
    #}

    #require_once 'views/' . $route->getControllerName() . '/' . $route->getMethodName() . '.php';

    if($controller instanceof \App\Core\ApiController) {
        ob_clean();
        header('Content-type: application/json; charset=utf-8');
        echo json_encode($data);
        exit;
    }
    
    $loader = new \Twig\Loader\FilesystemLoader('./views');
    $twig = new \Twig\Environment($loader, [
        'cache' => './twig-cache',
        'auto_reload' => true
    ]);

    $data['BASE'] = Configuration::BASE;

    echo $twig->render($route->getControllerName() . '/' . $route->getMethodName() . '.html', $data);
