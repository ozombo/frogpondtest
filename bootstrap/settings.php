<?php

/**
 * Application settings.
 */

$dotenv = new Dotenv\Dotenv(__DIR__.'/../config/');
$dotenv->load();

return [
    'settings' => [
        'displayErrorDetails' => getenv('DEBUG'),
        'db' => [
            'host' => getenv('DB_HOST'),
            'port' => getenv('DB_PORT'),
            'user' => getenv('DB_USERNAME'),
            'pass' => getenv('DB_PASSWORD'),
            'dbname' => getenv('DB_DATABASE'),
            'charset' => getenv('DB_CHARSET'),
        ],
        'twig' => [
            'template_path' => __DIR__ . '/../templates/',
            'cache_path' => __DIR__.'/../cache/',
            'debug' => getenv('DEBUG'),
        ],
        'monolog' => [
            'name' => getenv('LOGGER_NAME'),
            'path' => __DIR__.'/../logs/app.log',
        ],
    ],
];
