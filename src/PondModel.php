<?php

namespace Jewei\Frognation;

use Jewei\Frognation\PondEntity;

class PondModel extends Model
{
    /**
     * Get all ponds.
     *
     * @return  array   An array of PondEntity
     */
    public function getAll()
    {
        $stmt = $this->db->query('SELECT * FROM ponds');
        $results = [];
        while ($row = $stmt->fetch()) {
            $results[] = new PondEntity($row);
        }
        return $results;
    }
    /**
     * Get one pond by its ID.
     *
     * @param   int     $id     The ID of the ticket
     * @return  PondEntity      The ticket
     */
    public function getById($id)
    {
        $pond = false;
        $stmt = $this->db->prepare('SELECT * FROM ponds WHERE id = :id');
        if ($result = $stmt->execute(['id' => $id])) {
            $pond = new PondEntity($stmt->fetch());
        }
        return $pond;
    }

    /**
     * Method to save a pond.
     *
     * Whether to update/insert is depends on the existance of $id.
     */
    public function save(PondEntity $pond)
    {
        $insert_sql = 'INSERT INTO ponds
            (name, image, description, location, status) values
            (:name, :image, :description, :location, :status)';

        $update_sql = 'UPDATE ponds SET
            name = :name,
            image = :image,
            description = :description,
            location = :location,
            status = :status
            WHERE id = :id';

        $sql = $pond->getId() ? $update_sql: $insert_sql;
        $stmt = $this->db->prepare($sql);

        $data = [
            'name' => $pond->getName(),
            'image' => $pond->getImage(),
            'description' => $pond->getDescription(),
            'location' => $pond->getLocation(),
            'status' => $pond->getStatus(),
        ];

        if ($pond->getId()) {
            $data['id'] = $pond->getId();
        }

        if (!$result = $stmt->execute($data)) {
            throw new Exception('Could not save record');
        }

        $last_id = $this->db->lastInsertId();

        return $last_id !== '0' ? $last_id : $result;
    }

    /**
     * Method to delete a pond.
     */
    public function delete(PondEntity $pond)
    {
        $stmt = $this->db->prepare('DELETE FROM ponds WHERE id = :id');
        return $stmt->execute(['id' => $pond->getId()]);
    }
}
