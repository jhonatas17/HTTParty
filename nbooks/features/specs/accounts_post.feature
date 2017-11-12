#language:pt

Funcionalidade: Cadastro de usuário

  @smoke
  Cenario: Novo usuário

    Dado que o cliente informou seus dados cadastrais:
      | name     | Jhonatas Santos    |
      | email    | jhonatas@teste.com |
      | password | 123                |
    Quando faço uma requisição POST para o serviço accounts
    Então o código de resposta deve ser "200"

@duplicado
  Cenario: Não permite email duplicado
 
    Dado que o cliente informou seus dados cadastrais:
     | name     | Jhonatas Duplicado     |
     | email    | jhonatas@duplicado.com |
     | password | 123                    |
   Mas esse cliente já está cadastrado
   Quando faço uma requisição POST para o serviço accounts
   Então o código de resposta deve ser "409"
   E deve ser exibido um JSON com a mensagem:
  """
  O e-mail informado, ja está cadastrado!
  """   
Esquema do Cenario: Campos obrigatórios

  Dado que o cliente informou seus dados cadastrais:
     | name     | <nome>  |
     | email    | <email> |
     | password | <senha> |
  Quando faço uma requisição POST para o serviço accounts
  Então o código de resposta deve ser "409"
  E deve ser exibido um JSON com a mensagem:
  """
  <mensagem>
  """   

  Exemplos: 
  | nome                   | email                  | senha | mensagem                    |
  |                        | jhonatas@duplicado.com | 123   | Nome deve ser obrigatório!  |
  | Jhonatas Duplicado     |                        | 123   | Email deve ser obrigatório! |
  | Jhonatas Duplicado     | jhonatas@duplicado.com |       | Senha deve ser obrigatório! |

