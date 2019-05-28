<?php

namespace Jewei\Frognation;

class PondEntity
{
    /**
     * Pond ID.
     */
    protected $id;

    /**
     * Name of the Pond.
     */
    protected $name;

    /**
     * Image of pond's view.
     */
    protected $image;

    /**
     * Pond's description.
     */
    protected $description;

    /**
     * The location of the pond.
     */
    protected $location;

    /**
     * The status of the pond.
     */
    protected $status;

    /**
     * Accept an array of data matching properties of this class
     * and create the class
     *
     * @param array $data The data to use to create
     */
    public function __construct(array $data)
    {
        if (isset($data['id'])) {
            $this->id = $data['id'];
        }
        $this->id = $data['id'];
        $this->name = $data['name'];
        $this->image = $data['image'];
        $this->description = $data['description'];
        $this->location = $data['location'];
        $this->status = $data['status'];
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getImage()
    {
        return $this->image;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function getShortDescription()
    {
        return substr($this->description, 0, 100);
    }

    public function getLocation()
    {
        return $this->location;
    }

    public function getStatus()
    {
        return $this->status;
    }
}
