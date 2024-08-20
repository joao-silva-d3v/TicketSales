-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `int_descricao_listar` (IN `var_id` TINYINT)   BEGIN 
      IF(var_id IS NULL) THEN 
        SELECT int_codigo,int_nome,int_funcao FROM integrantes;
      ELSE
        SELECT int_codigo, int_nome, int_funcao FROM integrantes where int_codigo=VAR_ID; 
      END IF; 
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `int_nome_inserir` (IN `var_codigo` TINYINT, `var_nome` CHAR(50), `var_funcao` CHAR(30))   BEGIN
 REPLACE INTO integrantes VALUES (var_codigo, var_nome, var_funcao);
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `set_descricao_inserir` (IN `var_codigo` TINYINT, `var_descricao` CHAR(50))   BEGIN
 REPLACE INTO setor VALUES (var_codigo, var_descricao);
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `set_descricao_listar` (IN `var_id` TINYINT)   BEGIN 
      IF(var_id IS NULL) THEN 
        SELECT set_codigo,set_descricao FROM setor;
      ELSE
        SELECT set_codigo, set_descricao FROM setor where set_codigo=VAR_ID; 
      END IF; 
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usu_nome_excluir` (IN `var_id` TINYINT)   BEGIN 
DELETE FROM tb_estado WHERE usu_codigo = var_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usu_nome_inserir` (IN `var_codigo` TINYINT, `var_nome` CHAR(50), `var_email` CHAR(30), `var_cpf` CHAR(30))   BEGIN
 REPLACE INTO usuario VALUES (var_codigo, var_nome, var_email, var_cpf);
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usu_nome_listar` (IN `var_id` TINYINT)   BEGIN 
      IF(var_id IS NULL) THEN 
        SELECT usu_codigo,usu_nome,usu_email,usu_cpf FROM usuario;
      ELSE
        SELECT usu_codigo, usu_nome, usu_email, usu_cpf  FROM tb_estado where usu_codigo=VAR_ID; 
      END IF; 
   END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ambiente`
--

CREATE TABLE `ambiente` (
  `amb_codigo` int(4) NOT NULL,
  `amb_eve_codigo` int(4) DEFAULT NULL,
  `amb_descricao` varchar(30) DEFAULT NULL,
  `amb_set_codigo` int(4) DEFAULT NULL,
  `amb_local` varchar(30) DEFAULT NULL,
  `amb_referencia` varchar(30) DEFAULT NULL,
  `amb_tpa_codigo` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `cat_codigo` int(4) NOT NULL,
  `cat_descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `com_codigo` int(4) NOT NULL,
  `com_usu_codigo` int(4) DEFAULT NULL,
  `com_ing_codigo` int(4) DEFAULT NULL,
  `com_data` datetime DEFAULT NULL,
  `com_total` varchar(10) DEFAULT NULL,
  `com_quantidade` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `evento`
--

CREATE TABLE `evento` (
  `eve_codigo` int(4) NOT NULL,
  `eve_descricao` varchar(30) DEFAULT NULL,
  `eve_data` datetime DEFAULT NULL,
  `eve_resumo` varchar(200) DEFAULT NULL,
  `eve_imagem` varchar(6) DEFAULT NULL,
  `eve_cat_codigo` int(4) DEFAULT NULL,
  `eve_int_codigo` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingresso`
--

CREATE TABLE `ingresso` (
  `ing_codigo` int(4) NOT NULL,
  `ing_eve_codigo` int(4) DEFAULT NULL,
  `ing_valor` varchar(10) DEFAULT NULL,
  `ing_tipo` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `integrantes`
--

CREATE TABLE `integrantes` (
  `int_codigo` int(4) NOT NULL,
  `int_nome` varchar(30) DEFAULT NULL,
  `int_funcao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `integrantes`
--

INSERT INTO `integrantes` (`int_codigo`, `int_nome`, `int_funcao`) VALUES
(5, 'Carlinhos', 'Segurança');

-- --------------------------------------------------------

--
-- Estrutura da tabela `setor`
--

CREATE TABLE `setor` (
  `set_codigo` int(4) NOT NULL,
  `set_descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `setor`
--

INSERT INTO `setor` (`set_codigo`, `set_descricao`) VALUES
(1, 'Setor 4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_ambiente`
--

CREATE TABLE `tipo_ambiente` (
  `tpa_codigo` int(4) NOT NULL,
  `tpa_descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `usu_codigo` int(4) NOT NULL,
  `usu_nome` varchar(30) DEFAULT NULL,
  `usu_email` varchar(30) DEFAULT NULL,
  `usu_cpf` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usu_codigo`, `usu_nome`, `usu_email`, `usu_cpf`) VALUES
(1, 'Gustavo', 'gustavo@email.com', '44444400');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `ambiente`
--
ALTER TABLE `ambiente`
  ADD PRIMARY KEY (`amb_codigo`),
  ADD KEY `amb_eve_codigo` (`amb_eve_codigo`),
  ADD KEY `amb_set_codigo` (`amb_set_codigo`),
  ADD KEY `amb_tpa_codigo` (`amb_tpa_codigo`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cat_codigo`);

--
-- Índices para tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`com_codigo`),
  ADD KEY `com_usu_codigo` (`com_usu_codigo`),
  ADD KEY `com_ing_codigo` (`com_ing_codigo`);

--
-- Índices para tabela `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`eve_codigo`),
  ADD KEY `eve_cat_codigo` (`eve_cat_codigo`),
  ADD KEY `eve_int_codigo` (`eve_int_codigo`);

--
-- Índices para tabela `ingresso`
--
ALTER TABLE `ingresso`
  ADD PRIMARY KEY (`ing_codigo`),
  ADD KEY `ing_eve_codigo` (`ing_eve_codigo`);

--
-- Índices para tabela `integrantes`
--
ALTER TABLE `integrantes`
  ADD PRIMARY KEY (`int_codigo`);

--
-- Índices para tabela `setor`
--
ALTER TABLE `setor`
  ADD PRIMARY KEY (`set_codigo`);

--
-- Índices para tabela `tipo_ambiente`
--
ALTER TABLE `tipo_ambiente`
  ADD PRIMARY KEY (`tpa_codigo`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_codigo`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `ambiente`
--
ALTER TABLE `ambiente`
  ADD CONSTRAINT `ambiente_ibfk_1` FOREIGN KEY (`amb_eve_codigo`) REFERENCES `evento` (`eve_codigo`),
  ADD CONSTRAINT `ambiente_ibfk_2` FOREIGN KEY (`amb_set_codigo`) REFERENCES `setor` (`set_codigo`),
  ADD CONSTRAINT `ambiente_ibfk_3` FOREIGN KEY (`amb_tpa_codigo`) REFERENCES `tipo_ambiente` (`tpa_codigo`);

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`com_usu_codigo`) REFERENCES `usuario` (`usu_codigo`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`com_ing_codigo`) REFERENCES `ingresso` (`ing_codigo`);

--
-- Limitadores para a tabela `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`eve_cat_codigo`) REFERENCES `categoria` (`cat_codigo`),
  ADD CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`eve_int_codigo`) REFERENCES `integrantes` (`int_codigo`);

--
-- Limitadores para a tabela `ingresso`
--
ALTER TABLE `ingresso`
  ADD CONSTRAINT `ingresso_ibfk_1` FOREIGN KEY (`ing_eve_codigo`) REFERENCES `evento` (`eve_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
