<?php

namespace Jewei\Frognation;

use Jewei\Frognation\FrogEntity;

class FrogModel extends Model
{
    /**
     * Get all frogs.
     *
     * @return  array   An array of FrogEntity
     */
    public function getAll()
    {
        $stmt = $this->db->query('SELECT * FROM frogs');
        $results = [];
        while ($row = $stmt->fetch()) {
            $results[] = new FrogEntity($row, $this->db);
        }
        return $results;
    }

    /**
     * Get one frog by its ID.
     *
     * @param   int     $id     The ID of the frog
     * @return  FrogEntity      The frog
     */
    public function getById($id)
    {
        $frog = false;
        $stmt = $this->db->prepare('SELECT * FROM frogs WHERE id = :id');
        if ($result = $stmt->execute(['id' => $id])) {
            $frog = new FrogEntity($stmt->fetch(), $this->db);
        }
        return $frog;
    }

     /**
     * Get frogs by pond ID.
     *
     * @param   int     $id     The ID of the pond
     * @return  FrogEntity      The frog
     */
    public function getByPondId($pond_id)
    {
        $frogs = [];
        $stmt = $this->db->prepare('SELECT * FROM frogs WHERE pond_id = :pond_id');

        if ($result = $stmt->execute(['pond_id' => $pond_id])) {
            while ($row = $stmt->fetch()) {
                $frogs[] = new FrogEntity($row, $this->db);
            }
        }
        return $frogs;
    }

    /**
     * Method to save a frog.
     *
     * Whether to update/insert is depends on the existance of $id.
     */
    public function save(FrogEntity $frog)
    {
        $insert_sql = 'INSERT INTO frogs
            (name, avatar, gender, dob, death, pond_id) values
            (:name, :avatar, :gender, :dob, :death, :pond_id)';

        $update_sql = 'UPDATE frogs SET
            name = :name,
            avatar = :avatar,
            gender = :gender,
            dob = :dob,
            death = :death,
            pond_id = :pond_id
            WHERE id = :id';

        $sql = $frog->getId() ? $update_sql: $insert_sql;
        $stmt = $this->db->prepare($sql);

        $data = [
            'name' => $frog->getName(),
            'avatar' => $frog->getAvatar(),
            'gender' => $frog->getGender(),
            'dob' => $frog->getDob(),
            'death' => $frog->getDeathDate(),
            'pond_id' => $frog->getPondId(),
        ];

        if ($frog->getId()) {
            $data['id'] = $frog->getId();
        }

        if (!$stmt->execute($data)) {
            throw new Exception('Could not save record');
        }

        $last_id = $this->db->lastInsertId();

        return $last_id !== '0' ? $last_id : $result;
    }

    /**
     * Method to delete a frog.
     */
    public function delete(FrogEntity $frog)
    {
        $stmt = $this->db->prepare('DELETE FROM frogs WHERE id = :id');
        return $stmt->execute(['id' => $frog->getId()]);
    }
}
