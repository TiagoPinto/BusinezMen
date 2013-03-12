BusinezMen
==========

This is an Project from one of our classes, where we develop an aplication for  Comercial Manager's

## Notas

Este documento está escrito no formato [Markdown](http://en.wikipedia.com/wiki/Markdown).

## Desenvolver sobre Eclipse

Estas breves notas ajudam a trabalhar no projeto *BusinezMen*, utilizando o Eclipse. 
O projeto está alojado no [gitHub](https://github.com/TiagoPinto/BusinezMen).

O projeto é público.

Convém, depois de [criar uma conta no gitHub](https://github.com), 
seguir os tutoriais e configurar adequadamente a [autenticação por chaves](https://github.com).
 
É necessário ter o plugin EGit instalado no Eclipse. 
Convém fazer o tutorial [Woking with EGit](http://www.vogella.com/articles/EGit/article.html) 
antes de avançar. 

#### Clonar o projecto (e guardar fora do workspace)

File -> Import -> Git Repository as New Project

URI: https://github.com/TiagoPinto/BusinezMen.git
Destination: ''uma pasta fora do workspace do Eclipse''

O novo projecto não pode ter um nome igual a outro projecto do Eclipse, já existente.

##### Alterar ficheiros existentes

Os ficheiros que já existiam, podem ser alterados. Depois de efectuadas as alterações convenientes, basta fazer o commit dos mesmos. 
Os commits são contra o repositório local. 
No fim será necessário enviar as alterações para o repositório *origin*.

##### Criar novos ficheiros

Depois de criados so ficheiros localmente, qualquer que seja o tipo, mas que sejam necessários para o projeto, usar Team -> Stage (para ficarem sobre a supervisão do git)

Depois fazer o commit (este commit é contra o repositório local). 

No fim será necessário enviar as alterações para o repositório *origin*.

#### Passar as alterações locais para o respositório

Por fim, fazer o push das alterações para o Bitbucket. 

Sobre o projeto, fazer Team -> Remotes -> Push current to -> origin

#### Atualizar o branch local a partir do branch remoto

Antes de proceder a alterações, pode atualizar o branch local com as alterações que entretanto foram feitas no repositório origem.

Team --> Pull
