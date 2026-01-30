<?php
namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Repositorios\RepositorioCursos;
use App\Servicios\ServicioCursos;

class CursosController extends ResourceController {

    protected $format = 'json';
    private ServicioCursos $servicio;

    public function __construct() {
        $repo = new RepositorioCursos();
        $this->servicio = new ServicioCursos($repo);
    }

    public function index() {
        return $this->respond($this->servicio->listarCursos());
    }

    public function show($id = null) {
        $curso = $this->servicio->obtenerCurso((int)$id);
        if (!$curso) return $this->failNotFound("Curso no encontrado");
        return $this->respond($curso);
    }
}
