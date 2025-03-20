<?php
session_start();

if (isset($_POST['cadastrar'])) {
    cadastrarContato();
}

function cadastrarContato() {
    include_once "../model/conexaoDB.php";
    include_once "../model/contato.php";
    include_once "../model/contatoService.php";
    include_once "../model/contatoDAO.php";

    $contato = new Contato();
    $contato->nome       = $_POST['nome'];
    $contato->descricao  = $_POST['descricao'];
    $contato->data_inicio = $_POST['data_inicio'];
    $contato->data_termino = $_POST['data_termino'];
    $contato->status     = $_POST['status'];
    $contato->senha      = $_POST['senha'];

    $service = new ContatoService();
    $response = $service->cadastrarContatoService($contato);

    if ($response['sucesso']) {
        $dao = new ContatoDAO();
        $dao->salvarContato($contato);
        
        $_SESSION['mensagem_sucesso'] = "Cadastro realizado com sucesso! Faça login.";
        header("Location: ../view/login.php");
        exit();
    } else {
        $_SESSION['mensagem_erro'] = $response['mensagem'];
        header("Location: ../view/cadastro.php");
        exit();
    }
}
?>

