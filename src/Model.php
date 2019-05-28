<?php

namespace Jewei\Frognation;

/**
 * Model abstract class.
 */
abstract class Model
{
    /**
     * Database.
     */
    protected $db;

    /**
     * Construt method.
     */
    public function __construct($db)
    {
        $this->db = $db;
    }
}
