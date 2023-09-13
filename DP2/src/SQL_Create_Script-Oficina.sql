SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficina` ;
USE `oficina` ;

-- -----------------------------------------------------
-- Table `oficina`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`clientes` (
  `id_Cliente` INT NOT NULL AUTO_INCREMENT,
  `cpf_cnpj` VARCHAR(14) NOT NULL,
  `nome_cli` VARCHAR(50) NOT NULL,
  `nascimento` DATE NOT NULL,
  `data_cadastro` DATE NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `uf` CHAR(2) NOT NULL,
  `cep` CHAR(9) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_Cliente`),
  UNIQUE INDEX (`cpf_cnpj` ASC) VISIBLE,
  INDEX `idx_clientes_nome` (`nome_cli` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `oficina`.`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`fornecedores` (
  `id_Fornecedor` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `cpf_cnpj` VARCHAR(14) NOT NULL,
  `razao_social` VARCHAR(50) NOT NULL,
  `nome_fantasia` VARCHAR(50) NULL DEFAULT NULL,
  `fund_nasc` DATE NOT NULL,
  `data_cadastro` DATE NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `cep` CHAR(9) NOT NULL,
  `uf` CHAR(2) NOT NULL,
  `responsavel` VARCHAR(50) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_Fornecedor`),
  UNIQUE INDEX (`cpf_cnpj` ASC) VISIBLE,
  INDEX `idx_fornecedores_razao_social` (`razao_social` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `oficina`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`funcionarios` (
  `id_funcionario` INT NOT NULL AUTO_INCREMENT,
  `CPF` CHAR(11) NOT NULL,
  `nome_func` VARCHAR(50) NOT NULL,
  `data_nasc` DATE NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `cep` CHAR(9) NOT NULL,
  `uf` CHAR(2) NOT NULL,
  `funcao` ENUM('Mecanico', 'Eletricista', 'Pintor', 'Funileiro', 'Lavador', 'Gerente', 'Recepcionista', 'Estoquista', 'Vendedor', 'Administrativo') NOT NULL DEFAULT 'Recepcionista',
  `lotacao` ENUM('Oficina', 'Vendas', 'Estoque', 'Recepcao', 'Administrativo', 'Gerencia') NOT NULL DEFAULT 'Administrativo',
  PRIMARY KEY (`id_funcionario`),
  UNIQUE INDEX (`CPF` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `oficina`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`produtos` (
  `id_produto` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nome_produto` VARCHAR(50) NOT NULL,
  `fabricante` VARCHAR(50) NOT NULL,
  `garantia_fabrica` ENUM('3 meses', '6 meses', '12 meses') NOT NULL DEFAULT '3 meses',
  `garantia_oficina` ENUM('3 meses', '6 meses', '12 meses') NOT NULL DEFAULT '3 meses',
  `quantidade` INT NOT NULL,
  `valor` FLOAT(9) NOT NULL,
  PRIMARY KEY (`id_produto`),
  INDEX `idx_produtos_nome` (`nome_produto` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `oficina`.`servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`servicos` (
  `id_servico` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nome_servico` CHAR(50) NOT NULL,
  `tipo_servico` ENUM('Orcamento', 'Estetico', 'Mecanico', 'Eletrico', 'Funilaria', 'Pintura') NOT NULL DEFAULT 'Orcamento',
  `tipo_cobranca` ENUM('Tarefa', 'Hora', 'Gratuito') NOT NULL DEFAULT 'Tarefa',
  `garantia_oficina` ENUM('3 meses', '6 meses', '12 meses') NOT NULL DEFAULT '3 meses',
  `valor` FLOAT(9) NULL DEFAULT NULL,
  PRIMARY KEY (`id_servico`),
  INDEX `idx_nome_servico` (`nome_servico` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `oficina`.`Equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Equipe` (
  `idEquipe` INT NOT NULL AUTO_INCREMENT,
  `Nome_Equipe` VARCHAR(45) NOT NULL,
  `Tec_1` INT NOT NULL,
  `Tec_2` INT NOT NULL,
  PRIMARY KEY (`idEquipe`),
  UNIQUE INDEX `Nome_Equipe_UNIQUE` (`Nome_Equipe` ASC) VISIBLE,
  UNIQUE INDEX `Tec_1_UNIQUE` (`Tec_1` ASC) VISIBLE,
  UNIQUE INDEX `Tec_2_UNIQUE` (`Tec_2` ASC) VISIBLE,
  CONSTRAINT `fk_Equipe_Tec1_Funcionarios`
    FOREIGN KEY (`Tec_1`)
    REFERENCES `oficina`.`funcionarios` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipe_Tec2_Funcionarios`
    FOREIGN KEY (`Tec_2`)
    REFERENCES `oficina`.`funcionarios` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`ordemservico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`ordemservico` (
  `id_ordemservico` INT NOT NULL AUTO_INCREMENT,
  `placa_veiculo` CHAR(8) NOT NULL,
  `data_abertura` DATE NOT NULL,
  `prazo_entrega` DATE NOT NULL,
  `data_entrega` DATE NOT NULL,
  `valor_total_os` FLOAT(9) NOT NULL,
  `status` ENUM('Em Aberto', 'Autorizada', 'Cancelada', 'Em execução', 'Fechada', 'Faturada') NOT NULL DEFAULT 'Em Aberto',
  `clientes_id_Cliente` INT NOT NULL,
  `Equipe_idEquipe` INT NOT NULL,
  PRIMARY KEY (`id_ordemservico`, `clientes_id_Cliente`, `Equipe_idEquipe`, `valor_total_os`),
  INDEX `idx_ordemservico_placa_veiculo` (`placa_veiculo` ASC) VISIBLE,
  INDEX `idx_ordemservico_data_abertura` (`data_abertura` ASC) VISIBLE,
  INDEX `fk_ordemservico_clientes1_idx` (`clientes_id_Cliente` ASC) VISIBLE,
  INDEX `fk_ordemservico_Equipe1_idx` (`Equipe_idEquipe` ASC) VISIBLE,
  CONSTRAINT `fk_ordemservico_clientes1`
    FOREIGN KEY (`clientes_id_Cliente`)
    REFERENCES `oficina`.`clientes` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordemservico_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `oficina`.`Equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `oficina`.`OS_has_Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`OS_has_Produtos` (
  `ordemservico_id_ordemservico` INT NOT NULL,
  `produtos_id_produto` INT NOT NULL,
  `Quant` INT NOT NULL,
  PRIMARY KEY (`ordemservico_id_ordemservico`, `produtos_id_produto`),
  INDEX `fk_ordemservico_has_produtos_produtos1_idx` (`produtos_id_produto` ASC) INVISIBLE,
  INDEX `fk_ordemservico_has_produtos_ordemservico1_idx` (`ordemservico_id_ordemservico` ASC) VISIBLE,
  CONSTRAINT `fk_ordemservico_has_produtos_ordemservico1`
    FOREIGN KEY (`ordemservico_id_ordemservico`)
    REFERENCES `oficina`.`ordemservico` (`id_ordemservico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordemservico_has_produtos_produtos1`
    FOREIGN KEY (`produtos_id_produto`)
    REFERENCES `oficina`.`produtos` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `oficina`.`OS_has_Servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`OS_has_Servicos` (
  `ordemservico_id_ordemservico` INT NOT NULL,
  `servicos_id_servico` INT NOT NULL,
  `Quant` INT NOT NULL,
  PRIMARY KEY (`ordemservico_id_ordemservico`, `servicos_id_servico`),
  INDEX `fk_ordemservico_has_servicos_servicos1_idx` (`servicos_id_servico` ASC) VISIBLE,
  INDEX `fk_ordemservico_has_servicos_ordemservico1_idx` (`ordemservico_id_ordemservico` ASC) VISIBLE,
  CONSTRAINT `fk_ordemservico_has_servicos_ordemservico1`
    FOREIGN KEY (`ordemservico_id_ordemservico`)
    REFERENCES `oficina`.`ordemservico` (`id_ordemservico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordemservico_has_servicos_servicos1`
    FOREIGN KEY (`servicos_id_servico`)
    REFERENCES `oficina`.`servicos` (`id_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `oficina`.`produtos_has_fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`produtos_has_fornecedores` (
  `produtos_id_produto` INT NOT NULL,
  `fornecedores_id_Fornecedor` INT NOT NULL,
  PRIMARY KEY (`produtos_id_produto`, `fornecedores_id_Fornecedor`),
  INDEX `fk_produtos_has_fornecedores_fornecedores1_idx` (`fornecedores_id_Fornecedor` ASC) VISIBLE,
  INDEX `fk_produtos_has_fornecedores_produtos1_idx` (`produtos_id_produto` ASC) VISIBLE,
  CONSTRAINT `fk_produtos_has_fornecedores_produtos1`
    FOREIGN KEY (`produtos_id_produto`)
    REFERENCES `oficina`.`produtos` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_has_fornecedores_fornecedores1`
    FOREIGN KEY (`fornecedores_id_Fornecedor`)
    REFERENCES `oficina`.`fornecedores` (`id_Fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
