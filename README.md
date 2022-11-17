![header](https://github.com/Frepitol/uvv_bd_1_si1n/blob/main/assets/grey%20minimalist%20sarcastic%20twitter%20header.png?raw=true)
# Projeto de banco de dados para o setor de recursos humanos
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/Frepitol/uvv_bd_1_si1n/blob/main/licence) 

## Sobre o projeto
### Professor: Abrantes Araujo Silva Filho @computacaoraiz
### Matéria do curso de sistemas de informação da universidade de Vila velha

Foi passado um modelo lógico com alguns erros na sua estrutura. 

Esse projeto ainda está em desenvolvimento, tão quanto esse README, irei descrever todas as etapas de desenvolvimento.


## Modelo lógico com erros
![Modelo lógico para banco de dados](https://github.com/Frepitol/uvv_bd_1_si1n/blob/main/assets/hr.png)

## Modelo lógico corrigido
![Modelo lógico corrigido](https://github.com/Frepitol/uvv_bd_1_si1n/blob/main/assets/projeto_logico_corrigido.png)


### Tecnologias utilizadas
- PostgreSQL
- Mariadb/MySql


```bash
# clonar repositório
git clone https://github.com/Frepitol/uvv_bd_1_si1n

```

# Autor

Frederico Bisi Freire Pitol

https://www.linkedin.com/in/frederico-pitol/

---------------------------

### Existem algumas correções que foram desfeitas, falta editar essa seção  

## Primeiros Passos
Foi passado um modelo lógico com alguns erros na sua estrutura

#### Correções efetuadas: 

### Correção dos relacionamento 
 - O relacionamento entre a tabela departamento e a tabela empregados existia um relacionamento de N para N, nesse caso os dados ficam relacionados 
diretamente a um fato sendo necessário a criação de uma nova tabela auxiliar cuja a chave primária é o conjunto das duas 
chaves estrangeiras ou a crição de uma chave unica, como nos foi auxiliado em sala de aula não poderiamos criar uma nova tabela nesse modelo lógico, 
a solução que encontrei foi excluir  esse realacionamento, consequentemente deletando a **fk_id_departamento**. 
 - O relacionamento entre a tabela **empregados** para **historico_cargos** é um relacionamento identificado pois histórico cargos é uma entidade fraca e 
precisa estar estar associada a ocorrência da entidade forte 

 
### Mudança de tipagem dos atributos 
 - **pk_id_região** da tabela **paises** foi adicionado o atributo **not null**, já que um país não pode existir sem estar contido em um continente, ao passo 
em que uma região não pode existir sem nenhum pais.
 - **pk_id_pais** da tabela **localizações**  foi adicionado o atributo **not null**, já que uma localização não pode existir sem estar contido em um país.
 - **fk_id_departamento** da tabela **empregados**  foi adicionado o atributo **not null**, já que um funcionario não pode existir sem 
estar em um departamento.
 - **fk_id_cargo** da tabela **historico de cargos** pode ser nula, já que seu relacionamento é de 0:N 
 - **fk_id_departamento** teve o atributo **NOT NULL** adicionado, já que um empregado não pode ter um histórico de cargo sem estar alocado em algum departamento
 - **id_localização** teve o atributo **NOT NULL** adicionado, já que um departamento não pode existir sem uma localização
 - **ak_nome** da tabela **departamentos** teve o atributo **NOT NULL** adicionado, já que um departamento não pode existir sem uma nome.
 - **fk_id_pais** da tabela **localizacoes** teve o atributo **NOT NULL** adicionado, já que uma localização não pode existir sem um país.
 - **fk_uf** da tabela **localizacoes** teve o atributo **NOT NULL** adicionado, já que uma localização não pode existir sem um país.
 - **cep** da tabela **localizacoes** teve o atributo **NOT NULL** adicionado, já que toda localização possui cep e por ser uma informação de extrema relevancia dentro de um cadastro de endereços.
 - **id_gerente** 
 - **id_departamento** teve o atributo **NOT NULL** adicionado, já que para um funcionário ter um histórico de cargo ele precisa estar alocado em um departamento
 

### Mudança de cardinalidade
 - A cardinalidade do relacionamento da tabela **departamento** para a tabela **empregados** foi trocado excluida já que temos um relacionamento
 de **N:M** dessa forma
 - A cardinalidade do relacionamento da tabela **regioes** para a tabela **paises** foi trocado para **1:N** já que uma região não pode existir com zero países
 - A cardinalidade do relacionamento da tabela **paises** para a tabela **localizacoes** foi trocado para **1:N** já que um pais não pode existir com zero localizações.
 - A cardinalidade do auto-relacionamento da tabela empregados de **id_empregados** para **id_supervisor** foi trocada **1:1** para **0:1**
 já que se o supervisor for o empregado em questão, ele não obrigatoriamente terá um supervisor.

### 
- A tabela historico_cargos é uma tabela auxiliar, feita para resolver uma relação de N:M



----------------
