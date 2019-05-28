<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Jewei\Frognation\FrogEntity;
use Jewei\Frognation\FrogModel;
use Jewei\Frognation\PondEntity;
use Jewei\Frognation\PondModel;

/**
 * Routes & controller.
 */

$app->get('/hello/{name}', function (Request $request, Response $response) {
    return $response->getBody()->write(
        $this
            ->twig
            ->loadTemplate('frog.tpl')
            ->render([
                'name' => $request->getAttribute('name'),
            ])
    );
});

// Homepage.
$app->get('/', function (Request $request, Response $response) {
    $model = new FrogModel($this->db);
    $frogs = $model->getAll();

    return $response->getBody()->write(
        $this
            ->twig
            ->resolveTemplate('home.tpl')
            ->render([
                'frogs' => $frogs,
                'router' => $this->router,
            ])
    );
});

// Ponds listing.
$app->get('/ponds', function (Request $request, Response $response) {
    $model = new PondModel($this->db);
    $ponds = $model->getAll();

    return $response->getBody()->write(
        $this
            ->twig
            ->loadTemplate('ponds.tpl')
            ->render([
                'ponds' => $ponds,
                'router' => $this->router,
            ])
    );
});

// Pond create view.
$app->get('/pond/new', function (Request $request, Response $response) {
    return $response->getBody()->write(
        $this
            ->twig
            ->loadTemplate('pond_edit.tpl')
            ->render([
                'ponds' => [],
                'router' => $this->router,
            ])
    );
})->setName('pond-create-view');

// Pond save.
$app->post('/pond/new', function (Request $request, Response $response) {
    $post_data = $request->getParsedBody();
    $data = [];
    $data['name'] = filter_var($post_data['name'], FILTER_SANITIZE_STRING);
    $data['description'] = filter_var($post_data['description'], FILTER_SANITIZE_STRING);
    $data['location'] = filter_var($post_data['location'], FILTER_SANITIZE_STRING);
    $data['status'] = filter_var($post_data['status'], FILTER_SANITIZE_STRING);
    $data['image'] = '';
    $data['id'] = $post_data['id'] ? (int) $post_data['id'] : null;
    $isNew = $data['id'] ? false : true;

    $pond = new PondEntity($data);
    $model = new PondModel($this->db);
    $result = $model->save($pond);
    $response = $response->withRedirect("/ponds");

    $pond_id = $isNew ? $result : $data['id'];
    $action = $isNew ? 'Created' : 'Updated';

    $this->logger->addInfo(sprintf('Pond %s: %s', $action, $pond_id));

    return $response;
})->setName('pond-post');

// Pond view.
$app->get('/pond/{id}', function (Request $request, Response $response, $args) {
    $model = new PondModel($this->db);
    $pond = $model->getById((int) $args['id']);

    $model = new FrogModel($this->db);
    $frogs = $model->getByPondId($pond->getId());

    return $response->getBody()->write(
        $this
            ->twig
            ->loadTemplate('pond.tpl')
            ->render([
                'pond' => $pond,
                'frogs' => $frogs,
                'router' => $this->router,
            ])
    );
})->setName('pond-view');

// Pond edit view
$app->get('/pond/{id}/edit', function (Request $request, Response $response, $args) {
    $model = new PondModel($this->db);
    $pond = $model->getById((int) $args['id']);

    return $response->getBody()->write(
        $this
            ->twig
            ->loadTemplate('pond_edit.tpl')
            ->render([
                'pond' => $pond,
                'router' => $this->router,
            ])
    );
})->setName('pond-edit-view');

// Pond delete
$app->post('/pond/{id}/delete', function (Request $request, Response $response, $args) {
    $model = new PondModel($this->db);
    $pond = $model->getById((int) $args['id']);
    $model->delete($pond);
    $response = $response->withRedirect("/ponds");

    $this->logger->addInfo('Pond deleted: '.$pond->getId());

    return $response;
})->setName('pond-delete');

// Frogs Listing
$app->get('/frogs', function (Request $request, Response $response) {
    $model = new FrogModel($this->db);
    $frogs = $model->getAll();

    return $response->getBody()->write(
        $this
            ->twig
            ->loadTemplate('frogs.tpl')
            ->render([
                'frogs' => $frogs,
                'router' => $this->router,
            ])
    );
});

// Frog save.
$app->post('/frog/new', function (Request $request, Response $response) {
    $post_data = $request->getParsedBody();
    $data = [];
    $data['name'] = filter_var($post_data['name'], FILTER_SANITIZE_STRING);
    $data['gender'] = filter_var($post_data['gender'], FILTER_SANITIZE_STRING);
    $data['dob'] = filter_var($post_data['dob'], FILTER_SANITIZE_STRING);
    $data['pond_id'] = filter_var($post_data['pond_id'], FILTER_SANITIZE_NUMBER_INT);
    $data['avatar'] = '';
    $data['death'] = '0000-00-00';
    $data['id'] = $post_data['id'] ? (int) $post_data['id'] : null;
    $isNew = $data['id'] ? false : true;

    $frog = new FrogEntity($data);
    $model = new FrogModel($this->db);
    $result = $model->save($frog);
    $response = $response->withRedirect("/frogs");

    $frog_id = $isNew ? $result : $data['id'];
    $action = $isNew ? 'Created' : 'Updated';

    $this->logger->addInfo(sprintf('Frog %s: %s', $action, $frog_id));

    return $response;
})->setName('frog-post');

// Frog create view
$app->get('/frog/new', function (Request $request, Response $response) {
    $model = new PondModel($this->db);
    $ponds = $model->getAll();

    return $response->getBody()->write(
        $this
            ->twig
            ->loadTemplate('frog_edit.tpl')
            ->render([
                'frog' => [],
                'ponds' => $ponds,
                'router' => $this->router,
            ])
    );
})->setName('frog-create-view');

// Frog view
$app->get('/frog/{id}', function (Request $request, Response $response, $args) {
    $model = new FrogModel($this->db);
    $frog = $model->getById((int) $args['id']);

    return $response->getBody()->write(
        $this
            ->twig
            ->loadTemplate('frog.tpl')
            ->render([
                'frog' => $frog,
                'router' => $this->router,
            ])
    );
})->setName('frog-view');

// Frog edit view
$app->get('/frog/{id}/edit', function (Request $request, Response $response, $args) {
    $model = new FrogModel($this->db);
    $frog = $model->getById((int) $args['id']);

    $model = new PondModel($this->db);
    $ponds = $model->getAll();

    return $response->getBody()->write(
        $this
            ->twig
            ->loadTemplate('frog_edit.tpl')
            ->render([
                'frog' => $frog,
                'ponds' => $ponds,
                'router' => $this->router,
            ])
    );
})->setName('frog-edit-view');

// Frog delete
$app->post('/frog/{id}/delete', function (Request $request, Response $response, $args) {
    $model = new FrogModel($this->db);
    $frog = $model->getById((int) $args['id']);
    $model->delete($frog);
    $response = $response->withRedirect("/frogs");

    $this->logger->addInfo('Frog deleted: '.$frog->getId());

    return $response;
})->setName('frog-delete');
