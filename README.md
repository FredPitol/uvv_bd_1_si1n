![header](https://github.com/Frepitol/uvv_bd_1_si1n/blob/main/assets/grey%20minimalist%20sarcastic%20twitter%20header.png?raw=true)
# Projeto de banco de dados para uma empresa fictícia, atendendo o setor de recursos humanos
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/Frepitol/uvv_bd_1_si1n/blob/main/licence) 

## Sobre o projeto
### Professor: Abrantes Araújo Silva Filho @https://github.com/computacaoraiz
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


## Coisas que aprendi

Tivemos uma diferença de formato das datas, na hora de popular os dados no MYSQL, utilizei REGEX do VSCODE com o seguinte código.

1. **Regex**
 - Tive de trocar inúmeros inputs de dados que estavam com os nomes das tabelas em inglês, procurei uma solução que poderia resolver
 esse problema e para que nas próximas ocasiões em que me deparasse com esse tipo de problema, tivesse uma ferramenta que 
 automatizasse o processo me poupando tempo de trabalho
```
['](\d{2})[-](\d{2})[-](\d{4})['] -- Localizando as datas no formato DD-MM-AAAA

'$3-$2-$1' -- Alterando formato para AAAA-MM-dd
```
2. **Linguagem markdown**

3. **Diferenças da implementação entre os SGBDS Postgres e MySQL**


# Autor

Frederico Bisi Freire Pitol

https://www.linkedin.com/in/frederico-pitol/

---------------------------

