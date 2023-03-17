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


1. Para a modelagem do sistema foi adotado as seguintes premissas:
  - A stadia corrente está registrada junto a Tabela "Room" ao invés da tabela "Stay". A razão para isto é a redução de joins visando performance, desde que Stays crescerá com o tempo.
  - Foi considerado chamar Stays como InvoiceItems mas descartado.
  - Foi considerado criar Owner e Guest como nested classes do Usuário. Porém, optei por gerar simples herança desde que também atende bem e é uma a solução mais popular.
  - Não houve preocupação com estética e usabilidade da interface.
  
2. Foram feitos tests para o model e alguns poucos para requests usando rspec. Rodar rspec para executar os testes.

3. Ao rodar o seed, este apresenta um resumo da carga.

4. O devise foi removido para simplificar. O login é feito através da seleção do User na tela root. Não há authenticação.






  
