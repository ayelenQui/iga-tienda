<?php
namespace App\Servicios;

use App\Repositorios\RepositorioCursos;

class ServicioCursos {

    public function __construct(private RepositorioCursos $repo) {}

    public function listarCursos(): array {
        return $this->repo->listar();
    }

    public function obtenerCurso(int $id): ?array {
        if ($id <= 0) return null;
        return $this->repo->obtener($id);
    }
}
