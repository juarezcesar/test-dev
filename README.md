# README

1. Para a modelagem do sistema foi adotado as seguintes premissas:
  - A stadia corrente está registrada em campos na própria Tabela "Room" ao invés da tabela "Stay". A razão para isto é a redução de joins visando performance e simplificação do código. Assumindo também que a tabela Stay irá crescer indeterminadamente.
  - Foi considerado chamar Stays como InvoiceItems mas descartado.
  - Foi considerado criar Owner e Guest como nested classes do Usuário. Porém, optei por gerar simples herança desde que também atende bem e é uma a solução mais popular.
  - Não houve preocupação com estética e usabilidade da interface. Será fácil perceber.
  
2. Foram feitos tests para o model e alguns poucos para request usando rspec. Rodar rspec.

3. Ao rodar o seed, este apresentará um resumo da carga. Será util quando for navegar no sistema.

4. O devise foi removido para simplificar. O login é feito através da seleção do User na tela root. Não há authenticação.

5. Instalação: 
    5.1 git clone https://github.com/juarezcesar/test-dev.git
    5.2 cd test-dev
    5.3 bundle install
    5.4 rails db:create
    5.5 rails db:migrate
    5.6 rails db:seed
    5.7 rails s
    
6. Run spec to run the tests

    





  
