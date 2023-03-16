# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


1. Para a modelagem do sistema foi adotado a seguintes premissas:
  - A stadia corrente está registrada junto a Tabela "Room" ao invés da "Stay". A razão para isto é a redução de joins visando performance. 
  - Foi considerado criar Owner e Guest como nested classes do Usuário. Porém, optei por gerar simples herança simples desde que também atende bem a solução.


  

  
