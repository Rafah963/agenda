-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/03/2025 às 23:34
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `agenda`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividades`
--

CREATE TABLE `atividades` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `data_inicio` datetime NOT NULL,
  `data_termino` datetime NOT NULL,
  `status` enum('pendente','concluído','cancelado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `atividades`
--

INSERT INTO `atividades` (`id`, `usuario_id`, `titulo`, `descricao`, `data_inicio`, `data_termino`, `status`) VALUES
(2, 7, 'ciencia da computação', 'jnj', '2025-05-24 05:05:00', '2025-05-24 05:05:00', 'pendente'),
(3, 7, 'ciencia da computação', 'jnj', '2025-05-24 05:05:00', '2025-05-24 05:05:00', 'pendente'),
(4, 7, 'ciencia da computação', '78', '2025-03-20 20:00:00', '2025-03-20 20:00:00', 'pendente'),
(5, 7, 'ciencia da computação', '78', '2025-03-20 20:00:00', '2025-03-20 20:00:00', 'pendente'),
(6, 8, 'ciencia da computação', 'rerew', '2025-05-24 05:45:00', '2025-05-24 05:45:00', 'pendente'),
(7, 8, 'ciencia da computação', 'rerew', '2025-05-24 05:45:00', '2025-05-24 05:45:00', 'pendente'),
(8, 8, 'ciencia da computação', 'rerew', '2025-05-24 05:45:00', '2025-05-24 05:45:00', 'pendente'),
(9, 8, 'ciencia da computação', 'rerew', '2025-05-24 05:45:00', '2025-05-24 05:45:00', 'pendente'),
(10, 8, 'ciencia da computação', 'rerew', '2025-05-24 05:45:00', '2025-05-24 05:45:00', 'pendente'),
(11, 8, 'ciencia da computação', 'rerew', '2025-05-24 05:45:00', '2025-05-24 05:45:00', 'pendente'),
(12, 8, 'ciencia da computação', 'rerew', '2025-05-24 05:45:00', '2025-05-24 05:45:00', 'pendente'),
(13, 8, 'ciencia da computação', 'sa', '2025-03-10 04:59:00', '2025-03-10 04:59:00', 'pendente'),
(14, 8, 'ciencia da computação', 'sa', '2025-03-10 04:59:00', '2025-03-10 04:59:00', 'pendente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contatos`
--

CREATE TABLE `contatos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_termino` datetime NOT NULL,
  `status` enum('pendente','concluído','cancelado') NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `contatos`
--

INSERT INTO `contatos` (`id`, `nome`, `descricao`, `data_inicio`, `data_termino`, `status`, `senha`) VALUES
(7, 'angela', 'oiii', '2025-03-25 20:10:00', '2025-03-29 16:14:00', 'pendente', 'f499a1c670208cb3d4310fda7b64bf768304f67034d0bacadf14b92909a195fc'),
(8, 'manuelly', 'eae', '2025-03-20 17:25:00', '2026-01-29 17:25:00', 'pendente', '77910eec8938c888599e8fb0b766be9e60719461e582f9f42f563f82f0183d92');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atividades`
--
ALTER TABLE `atividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `contatos`
--
ALTER TABLE `contatos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atividades`
--
ALTER TABLE `atividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `contatos`
--
ALTER TABLE `contatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `atividades`
--
ALTER TABLE `atividades`
  ADD CONSTRAINT `atividades_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `contatos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
