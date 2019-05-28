<?php

/**
 * Dependencies to inject the DI Containter.
 */
$container = $app->getContainer();

$container['logger'] = function ($c) {
    $settings = $c->get('settings')['monolog'];
    $logger = new Monolog\Logger($settings['name']);
    $logger->pushHandler(new Monolog\Handler\StreamHandler($settings['path']));
    return $logger;
};

$container['db'] = function ($c) {
    $settings = $c->get('settings')['db'];
    $dsn = sprintf(
        'mysql:host=%s;dbname=%s;charset=%s',
        $settings['host'],
        $settings['dbname'],
        $settings['charset']
    );
    $pdo = new PDO(
        $dsn,
        $settings['user'],
        $settings['pass']
    );
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    return $pdo;
};

$container['twig'] = function ($c) {
    $settings = $c->get('settings')['twig'];
    Twig_Autoloader::register();
    $loader = new Twig_Loader_Filesystem($settings['template_path']);
    $twig = new Twig_Environment($loader, array(
        'cache' => $settings['cache_path'],
        'debug' => true,
    ));
    return $twig;
};
