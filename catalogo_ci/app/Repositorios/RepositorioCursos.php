<?php
namespace App\Repositorios;

use CodeIgniter\Database\BaseConnection;

class RepositorioCursos
{
    private BaseConnection $db;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
    }

    public function listar(): array
    {
        return $this->db->table("cursos")
            ->select("id, nombre, descripcion, detalle, precio, creado_en")
            ->get()
            ->getResultArray();
    }

    public function obtener(int $id): ?array
    {
        $curso = $this->db->table("cursos")
            ->select("id, nombre, descripcion, detalle, precio, creado_en")
            ->where("id", $id)
            ->get()
            ->getRowArray();

        if (!$curso) return null;

        $imagenes = $this->db->table("imagenes_curso")
            ->select("id, url, alt")
            ->where("curso_id", $id)
            ->get()
            ->getResultArray();

        $curso["imagenes"] = $imagenes;
        return $curso;
    }
}
