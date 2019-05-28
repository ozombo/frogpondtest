<?php

/**
 * Autoload composer.
 */
require __DIR__.'/../vendor/autoload.php';

/**
 * Start PHP session.
 */
session_start();

/**
 * Create the application.
 */
$app = new Slim\App(require __DIR__.'/../bootstrap/settings.php');

/**
 * Set up dependencies.
 */
require __DIR__.'/../bootstrap/dependencies.php';

/**
 * Register middleware.
 */
require __DIR__.'/../bootstrap/middleware.php';

/**
 * Load the application routes.
 */
require __DIR__.'/../bootstrap/controller.php';

/**
 * Run the application.
 */
$app->run();
