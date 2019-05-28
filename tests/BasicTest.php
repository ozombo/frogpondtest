<?php

namespace Jewei\Frognation;

use Jewei\Frognation\FrogModel;
use Jewei\Frognation\FrogEntity;
use Jewei\Frognation\PondModel;
use Jewei\Frognation\PondEntity;

class BasicTest extends \PHPUnit_Framework_TestCase
{
    public function testFrogModel()
    {
        $frogModel = new FrogModel($this->db);

        $this->assertInstanceOf('Jewei\Frognation\FrogModel', $frogModel);
        $this->assertTrue(is_subclass_of($frogModel, 'Jewei\Frognation\Model'));
    }

    public function testPondModel()
    {
        $pondModel = new PondModel($this->db);

        $this->assertInstanceOf('Jewei\Frognation\PondModel', $pondModel);
        $this->assertTrue(is_subclass_of($pondModel, 'Jewei\Frognation\Model'));
    }

    public function testFrogEntity()
    {
        $data = [
            'id' => '123',
            'name' => 'Hello Frog',
            'avatar' => 'hello_frog.jpg',
            'gender' => 'female',
            'dob' => '1982-02-26',
            'death' => '2013-04-01',
            'pond_id' => '321',
        ];

        $frogEntity = new FrogEntity($data);

        $this->assertEquals('123', $frogEntity->getId());
        $this->assertEquals('Hello Frog', $frogEntity->getName());
        $this->assertEquals('hello_frog.jpg', $frogEntity->getAvatar());
        $this->assertEquals('female', $frogEntity->getGender());
        $this->assertEquals('1982-02-26', $frogEntity->getDob());
        $this->assertEquals('2013-04-01', $frogEntity->getDeathDate());
        $this->assertEquals('321', $frogEntity->getPondId());
    }

    public function testPondEntity()
    {
        $data = [
            'id' => '456',
            'name' => 'Niagara Falls',
            'image' => 'niagara_falls.jpg',
            'description' => 'Lorem Ipsum',
            'location' => 'Niagara Falls, NY 14303, United States',
            'status' => 'open',
        ];

        $pondEntity = new PondEntity($data);

        $this->assertEquals('456', $pondEntity->getId());
        $this->assertEquals('Niagara Falls', $pondEntity->getName());
        $this->assertEquals('niagara_falls.jpg', $pondEntity->getImage());
        $this->assertEquals('Lorem Ipsum', $pondEntity->getDescription());
        $this->assertEquals('Lorem Ipsum', $pondEntity->getShortDescription());
        $this->assertEquals('Niagara Falls, NY 14303, United States', $pondEntity->getLocation());
        $this->assertEquals('open', $pondEntity->getStatus());
    }

    protected function setUp()
    {
        $this->db = new \PDO('sqlite::memory:');
    }

    protected function tearDown()
    {
        $this->db = null;
    }
}
