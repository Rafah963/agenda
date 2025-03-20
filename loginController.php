<?php
session_start();
include_once "../model/conexaoDB.php";

if (isset($_POST['login'])) {
    $nome = $_POST['nome'];
    $senha = $_POST['senha'];

    $conexao = (new ConexaoDB())->abrirConexao();
    
   
    $query = "SELECT * FROM contatos WHERE nome = ?";
    $stmt = $conexao->prepare($query);
    $stmt->bind_param("s", $nome);
    $stmt->execute();
    $resultado = $stmt->get_result();
    
    if ($resultado->num_rows > 0) {
        $usuario = $resultado->fetch_assoc();
        $senha_hash = hash('sha256', $senha . hash('sha256', "agenda")); // Hash com salt

        if ($senha_hash === $usuario['senha']) {
            
            $_SESSION['usuario_id'] = $usuario['id'];
            $_SESSION['usuario_nome'] = $usuario['nome'];

           
            header("Location: ../view/home.php");
            exit();
        } else {
            $_SESSION['mensagem_erro'] = "Senha incorreta!";
        }
    } else {
        $_SESSION['mensagem_erro'] = "Usuário não encontrado!";
    }

   
    header("Location: ../view/login.php");
    exit();
}
?>

