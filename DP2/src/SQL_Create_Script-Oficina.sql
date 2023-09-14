SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema oficina_z
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficina_z` ;
USE `oficina_z` ;


-- -----------------------------------------------------
-- Table `oficina_z`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_z`.`clientes` (
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
  PRIMARY KEY (`id_Cliente`)
  )
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = latin1;
  create INDEX `idx_clientes_nome` on clientes(`nome_cli`);


-- -----------------------------------------------------
-- Table `oficina_z`.`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_z`.`fornecedores` (
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
  PRIMARY KEY (`id_Fornecedor`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
create INDEX `idx_fornecedores_razao_social` on fornecedores(`razao_social`);


-- -----------------------------------------------------
-- Table `oficina_z`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_z`.`funcionarios` (
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
  PRIMARY KEY (`id_funcionario`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
create INDEX idx_funcionarios_nome_func on funcionarios(`CPF`);


-- -----------------------------------------------------
-- Table `oficina_z`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_z`.`produtos` (
  `id_produto` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nome_produto` VARCHAR(50) NOT NULL,
  `fabricante` VARCHAR(50) NOT NULL,
  `garantia_fabrica` ENUM('3 meses', '6 meses', '12 meses') NOT NULL DEFAULT '3 meses',
  `garantia_oficina_z` ENUM('3 meses', '6 meses', '12 meses') NOT NULL DEFAULT '3 meses',
  `quantidade` INT NOT NULL,
  `valor` FLOAT(9) NOT NULL,
  PRIMARY KEY (`id_produto`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
create INDEX idx_produtos_nome on produtos(`nome_produto`);


-- -----------------------------------------------------
-- Table `oficina_z`.`servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_z`.`servicos` (
  `id_servico` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nome_servico` CHAR(50) NOT NULL,
  `tipo_servico` ENUM('Orcamento', 'Estetico', 'Mecanico', 'Eletrico', 'Funilaria', 'Pintura') NOT NULL DEFAULT 'Orcamento',
  `tipo_cobranca` ENUM('Tarefa', 'Hora', 'Gratuito') NOT NULL DEFAULT 'Tarefa',
  `garantia_oficina_z` ENUM('3 meses', '6 meses', '12 meses') NOT NULL DEFAULT '3 meses',
  `valor` FLOAT(9) NULL DEFAULT NULL,
  PRIMARY KEY (`id_servico`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
create INDEX idx_nome_servico  on servicos(`nome_servico`);

-- -----------------------------------------------------
-- Table `oficina_z`.`Equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_z`.`Equipe` (
  `idEquipe` INT NOT NULL AUTO_INCREMENT,
  `Nome_Equipe` VARCHAR(45) NOT NULL,
  `Tec_1` INT NOT NULL,
  `Tec_2` INT NOT NULL,
  PRIMARY KEY (`idEquipe`),
  CONSTRAINT `fk_Equipe_Tec1_Funcionarios`
    FOREIGN KEY (`Tec_1`)
    REFERENCES `oficina_z`.`funcionarios` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipe_Tec2_Funcionarios`
    FOREIGN KEY (`Tec_2`)
    REFERENCES `oficina_z`.`funcionarios` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_z`.`ordemservico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_z`.`ordemservico` (
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
  INDEX `fk_ordemservico_clientes1_idx` (`clientes_id_Cliente`),
  INDEX `fk_ordemservico_Equipe1_idx` (`Equipe_idEquipe`) ,
  CONSTRAINT `fk_ordemservico_clientes1`
    FOREIGN KEY (`clientes_id_Cliente`)
    REFERENCES `oficina_z`.`clientes` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordemservico_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `oficina_z`.`Equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
create INDEX `idx_ordemservico_placa_veiculo` on ordemservico(`placa_veiculo`);
create INDEX `idx_ordemservico_data_abertura` on ordemservico(`data_abertura`);
  

-- -----------------------------------------------------
-- Table `oficina_z`.`OS_has_Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_z`.`OS_has_Produtos` (
  `ordemservico_id_ordemservico` INT NOT NULL,
  `produtos_id_produto` INT NOT NULL,
  `Quant` INT NOT NULL,
  PRIMARY KEY (`ordemservico_id_ordemservico`, `produtos_id_produto`),
    CONSTRAINT `fk_ordemservico_has_produtos_ordemservico1`
    FOREIGN KEY (`ordemservico_id_ordemservico`)
    REFERENCES `oficina_z`.`ordemservico` (`id_ordemservico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordemservico_has_produtos_produtos1`
    FOREIGN KEY (`produtos_id_produto`)
    REFERENCES `oficina_z`.`produtos` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
create INDEX `fk_ordemservico_has_produtos_produtos1_idx` on os_has_produtos(`produtos_id_produto`);
create INDEX `fk_ordemservico_has_produtos_ordemservico1_idx` on os_has_produtos(`ordemservico_id_ordemservico`);

-- -----------------------------------------------------
-- Table `oficina_z`.`OS_has_Servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_z`.`OS_has_Servicos` (
  `ordemservico_id_ordemservico` INT NOT NULL,
  `servicos_id_servico` INT NOT NULL,
  `Quant` INT NOT NULL,
  PRIMARY KEY (`ordemservico_id_ordemservico`, `servicos_id_servico`),
    CONSTRAINT `fk_ordemservico_has_servicos_ordemservico1`
    FOREIGN KEY (`ordemservico_id_ordemservico`)
    REFERENCES `oficina_z`.`ordemservico` (`id_ordemservico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordemservico_has_servicos_servicos1`
    FOREIGN KEY (`servicos_id_servico`)
    REFERENCES `oficina_z`.`servicos` (`id_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
create INDEX `fk_ordemservico_has_servicos_servicos1_idx` on OS_has_Servicos(`servicos_id_servico`);
create INDEX `fk_ordemservico_has_servicos_ordemservico1_idx` on OS_has_Servicos(`ordemservico_id_ordemservico`);

-- -----------------------------------------------------
-- Table `oficina_z`.`produtos_has_fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_z`.`produtos_has_fornecedores` (
  `produtos_id_produto` INT NOT NULL,
  `fornecedores_id_Fornecedor` INT NOT NULL,
  PRIMARY KEY (`produtos_id_produto`, `fornecedores_id_Fornecedor`),
    CONSTRAINT `fk_produtos_has_fornecedores_produtos1`
    FOREIGN KEY (`produtos_id_produto`)
    REFERENCES `oficina_z`.`produtos` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_has_fornecedores_fornecedores1`
    FOREIGN KEY (`fornecedores_id_Fornecedor`)
    REFERENCES `oficina_z`.`fornecedores` (`id_Fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
create INDEX `fk_produtos_has_fornecedores_fornecedores1_idx` on  produtos_has_fornecedores(`fornecedores_id_Fornecedor`);
create INDEX `fk_produtos_has_fornecedores_produtos1_idx` on produtos_has_fornecedores(`produtos_id_produto`);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
