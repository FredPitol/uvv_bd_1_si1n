--Deletando database caso exista 
DROP DATABASE IF EXISTS uvv
;
--Deletando user caso exista
DROP USER IF EXISTS fredericopitol
;
--Deletando schema caso exista
DROP SCHEMA IF EXISTS hr
;
-- Criando usuário
CREATE USER fredericopitol WITH 
SUPERUSER
ENCRYPTED PASSWORD 'frederico'
;
-- Criando banco de dados
CREATE DATABASE uvv
WITH 
OWNER = fredericopitol
ENCODING = 'UTF8'
TEMPLATE = template0
LC_COLLATE = 'pt_BR.UTF-8'
LC_CTYPE = 'pt_BR.UTF-8'
ALLOW_CONNECTIONS = True
;
--Comentário
COMMENT ON DATABASE uvv
    IS 'Banco de dados para PSET1'
;
-- path do usuário fredericopitol para o esquema  hr
ALTER USER fredericopitol
SET SEARCH_PATH TO hr, "$user", public
;
-- Me conectando no banco de dados uvv, com meu usuario.

\c "dbname=uvv user=fredericopitol password=frederico"

-- Criando SCHEMA dentro do banco de dados UVV

CREATE SCHEMA hr
	AUTHORIZATION fredericopitol;

--Criando tabela com os continentes, adicionando aks, comentando colunas

CREATE TABLE hr.regioes (
                id_regiao INTEGER NOT NULL,
                nome VARCHAR(25) NOT NULL,
                CONSTRAINT id_regiao PRIMARY KEY (id_regiao)
);
COMMENT ON COLUMN hr.regioes.id_regiao IS 'Chave primária da tabela regiões.';
COMMENT ON COLUMN hr.regioes.nome IS 'Nomes das regiões';


CREATE INDEX regioes_idx
 ON hr.regioes
 ( nome );

CREATE UNIQUE INDEX regioes_idx1
 ON hr.regioes
 ( nome )
 ;
--Criando tabela paises, adicionando PK e AK e comentando cada atributo
CREATE TABLE hr.paises (
                id_pais CHAR(2) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                id_regiao INTEGER NOT NULL,
                CONSTRAINT id_pais PRIMARY KEY (id_pais)
);
COMMENT ON TABLE hr.paises IS 'Tabela com as informaçõs dos países.';
COMMENT ON COLUMN hr.paises.id_pais IS 'Chave primária da tabela países.';
COMMENT ON COLUMN hr.paises.nome IS 'Nome do país';
COMMENT ON COLUMN hr.paises.id_regiao IS 'Chave estrangeira para a tabela de regiões.';


CREATE UNIQUE INDEX paises_idx
 ON hr.paises
 ( nome );

--Criando tabela localizações, adicionando chave primária e comentando cada atributo
CREATE TABLE hr.localizacoes (
                id_localizacao INTEGER NOT NULL,
                endereco VARCHAR(50),
                cep VARCHAR(12) ,
                cidade VARCHAR(50),
                uf VARCHAR(25),
                id_pais CHAR(2) NOT NULL,
                CONSTRAINT id_localizacao PRIMARY KEY (id_localizacao)
);
COMMENT ON TABLE hr.localizacoes IS 'Tabela localizaçõs. Contém os endereços de diversos escritórios e facilidades
da empresa. Não armazena endereços de clientes.';
COMMENT ON COLUMN hr.localizacoes.id_localizacao IS 'Chave primária da tabela.';
COMMENT ON COLUMN hr.localizacoes.endereco IS 'endereco da empresa';
COMMENT ON COLUMN hr.localizacoes.cep IS 'Codigo postal da localizacao';
COMMENT ON COLUMN hr.localizacoes.cidade IS 'Cidade onde está localizado o departamento.';
COMMENT ON COLUMN hr.localizacoes.uf IS 'Estado(abreviado ou por extenso)';
COMMENT ON COLUMN hr.localizacoes.id_pais IS 'Chave estrangeira para a tabela de países.'
;
--Criando tabela cargos, adicionando chave primária e comentando cada atributo
CREATE TABLE hr.cargos (
                id_cargo VARCHAR(10) NOT NULL,
                cargo VARCHAR(35) NOT NULL,
                salario_minimo NUMERIC(8,2),
                salario_maximo NUMERIC(8,2),
                CONSTRAINT id_cargo PRIMARY KEY (id_cargo)
);
COMMENT ON TABLE hr.cargos IS 'Armazena os cargos existentes e a faixa salarial (mínimo e máximo)';
COMMENT ON COLUMN hr.cargos.id_cargo IS 'Chave primária da tabela';
COMMENT ON COLUMN hr.cargos.cargo IS 'Nome do cargo';
COMMENT ON COLUMN hr.cargos.salario_minimo IS 'O menor salário admitido para um cargo';
COMMENT ON COLUMN hr.cargos.salario_maximo IS 'O maior salário admitido para um cargo';


CREATE UNIQUE INDEX cargos_idx
 ON hr.cargos
 ( cargo )
 ;
--Criando tabela empregados, adicionando PK e AK e comentando cada atributo

CREATE TABLE hr.empregados (
                pk_id_empregado INTEGER NOT NULL,
                nome VARCHAR(75) NOT NULL,
                sobrenome VARCHAR(75),
                email VARCHAR(35) NOT NULL,
                telefone VARCHAR(20),
                data_contratacao DATE NOT NULL,
                id_cargo VARCHAR(10) NOT NULL,
                salario NUMERIC(8,2),
                id_supervisor INTEGER,
                comissao NUMERIC(4,2), 
                id_empregado_delete integer,
                CONSTRAINT pk_id_empregado PRIMARY KEY (pk_id_empregado))
                ;
COMMENT ON TABLE hr.empregados IS 'Informações dos empregados';
COMMENT ON COLUMN hr.empregados.pk_id_empregado IS 'Chave primária da tabela';
COMMENT ON COLUMN hr.empregados.nome IS 'Nome completo do empregado';
COMMENT ON COLUMN hr.empregados.email IS 'Parte inicial do email do empregado (antes do @)';
COMMENT ON COLUMN hr.empregados.telefone IS 'Telefone do empregado Ex: 5522999999999';
COMMENT ON COLUMN hr.empregados.data_contratacao IS 'Data que o empregado iniciou no cargo atual.';
COMMENT ON COLUMN hr.empregados.id_cargo IS 'Indica o cargo atual do empregado';
COMMENT ON COLUMN hr.empregados.salario IS 'Salário mensal atual do empregado.';
COMMENT ON COLUMN hr.empregados.comissao IS 'Apenas empregados do departamento de vendas recebem comissão.';
COMMENT ON COLUMN hr.empregados.id_supervisor IS 'Indica o supervisor direto do empregado';


CREATE INDEX empregados_idx
 ON hr.empregados
 ( email );

CREATE UNIQUE INDEX empregados_idx1
 ON hr.empregados
 ( email )
 ;
--Criando tabela departamentos, adicionando PK e AK e comentando cada atributo
CREATE TABLE hr.departamentos (
                id_departamento INTEGER NOT NULL,
                nome VARCHAR(50) NOT NULL,
                id_gerente INTEGER ,
                fk_id_localizacao INTEGER,
                CONSTRAINT id_departamento PRIMARY KEY (id_departamento)
);
COMMENT ON TABLE hr.departamentos IS 'Informações sobre os departamentos da empresa';
COMMENT ON COLUMN hr.departamentos.id_departamento IS 'Chave primária da tabela departamentos. nao existe nem um ponto que restringa o um regitro errado';
COMMENT ON COLUMN hr.departamentos.nome IS 'Nome do departamento';
COMMENT ON COLUMN hr.departamentos.fk_id_localizacao IS 'Chave estrangeira para a tabela de localizações';
COMMENT ON COLUMN hr.departamentos.id_gerente IS 'FK da tabela empregados';


CREATE UNIQUE INDEX departamentos_idx
 ON hr.departamentos
 ( nome );

--Criando tabela historico_cargos, adicionando chave composta e comentando cada atributo
CREATE TABLE hr.historico_cargos (
                pfk_id_empregado INTEGER NOT NULL,
                data_inicial DATE NOT NULL,
                data_final DATE NOT NULL,
                id_cargo VARCHAR(10) NOT NULL,
                id_departamento INTEGER NOT NULL,
                CONSTRAINT pfk_id_empregado PRIMARY KEY (data_inicial, pfk_id_empregado)
);
COMMENT ON TABLE hr.historico_cargos IS 'Tabela que armazena o histórico de cargos de um empregado. Se um empregado
mudar de departamento dentro de um cargo ou mudar de cargo dentro de um
departamento, novas linhas devem ser inseridas nesta tabela com a informação
antiga do empregado.';
COMMENT ON COLUMN hr.historico_cargos.data_inicial IS 'Indica a data inicial do empregado em um cargo';
COMMENT ON COLUMN hr.historico_cargos.pfk_id_empregado IS 'Chave primária e estrangeira da tabela';
COMMENT ON COLUMN hr.historico_cargos.data_final IS 'e a data inicial.';
COMMENT ON COLUMN hr.historico_cargos.id_cargo IS 'Chave primária da tabela';
COMMENT ON COLUMN hr.historico_cargos.id_departamento IS 'Identificador do departamento';

-- Adicionando as FKS

ALTER TABLE hr.paises ADD CONSTRAINT regioes_paises_fk
FOREIGN KEY (id_regiao)
REFERENCES hr.regioes (id_regiao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE hr.localizacoes ADD CONSTRAINT paises_localizacoes_fk
FOREIGN KEY (id_pais)
REFERENCES hr.paises (id_pais)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE hr.departamentos ADD CONSTRAINT localizacoes_departamentos_fk
FOREIGN KEY (fk_id_localizacao)
REFERENCES hr.localizacoes (id_localizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE hr.empregados ADD CONSTRAINT cargos_empregados_fk
FOREIGN KEY (id_cargo)
REFERENCES hr.cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE hr.historico_cargos ADD CONSTRAINT cargos_historico_cargos_fk
FOREIGN KEY (id_cargo)
REFERENCES hr.cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE hr.empregados ADD CONSTRAINT empregados_empregados_fk
FOREIGN KEY (id_supervisor)
REFERENCES hr.empregados (pk_id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE hr.departamentos ADD CONSTRAINT empregados_gerente_fk
FOREIGN KEY (id_gerente)
REFERENCES hr.empregados (pk_id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE hr.historico_cargos ADD CONSTRAINT empregados_historico_cargos_fk
FOREIGN KEY (pfk_id_empregado)
REFERENCES hr.empregados (pk_id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE hr.historico_cargos ADD CONSTRAINT departamentos_historico_cargos_fk
FOREIGN KEY (id_departamento)
REFERENCES hr.departamentos (id_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;