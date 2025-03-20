<?php
session_start();
include_once "../model/atividade.php";
include_once "../model/atividadeDAO.php";

$dao = new AtividadeDAO();


error_reporting(E_ALL);
ini_set('display_errors', 1);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $atividade = new Atividade();
    $atividade->usuario_id = $_SESSION['usuario_id'];
    $atividade->titulo = $_POST['titulo'];
    $atividade->descricao = $_POST['descricao'];
    $atividade->data_inicio = $_POST['data'] . " " . $_POST['hora'] . ":00";
    $atividade->data_termino = $_POST['data'] . " " . $_POST['hora'] . ":00";
    $atividade->status = "pendente";

    if (!empty($_POST['id'])) {
    
        $atividade->id = $_POST['id'];
        $sucesso = $dao->atualizarAtividade($atividade);
    } else {
        // Criar novo compromisso
        $sucesso = $dao->criarAtividade($atividade);
    }

    echo json_encode(["sucesso" => $sucesso]);
    exit();
}


if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['excluir'])) {
    $sucesso = $dao->excluirAtividade($_GET['excluir']);
    echo json_encode(["sucesso" => $sucesso]);
    exit();
}
?>
