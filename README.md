# ToScrape

Webcrawler/API agregadora de frases do site (Quotes to Scrape)[http://quotes.toscrape.com/]

## Stack do Projeto
- Ruby 2.5.3
- Rails 5.2.2
- Mongoid 7.0
- Redis 
- Sidekiq

## Configurando o ambiente

Para utilizar o projeto é necessário seguir aos seguintes passos:

Primeiro é necessário clonar o projeto com o comando:

`git clone git@github.com:JhoMartins/toscrape.git`

Entrar na pasta do projeto

`cd toscrape`

Instalar as dependências do projeto: 

`bundle install`

Subir o MongoDB

`sudo service mongod start`

Subir o redis

`redis-server`

Subir o sidekiq

`bundle exec sidekiq`


### Utilizando o projeto

Para utilizar a API de frases, primeiro é necessário obter um token de acesso, para isso, deve ser efetuada a criação de um usuário no banco e sem seguida o token obtido será utilizado para autenticar os demais endpoints

#### Recebendo um Token

`POST` request para o endpoint `/users`

Headers: `Content-Type: application/json`

Body:

```json
{
  "user": {
  	"email": "teste@inova.com.br"
  }
} 
```

O retorno do token virá no response body:

```json
{
    "_id": {
        "$oid": "5c0d80ae15e02e08855c04eb"
    },
    "authentication_token": "af2f96c32f2ef931ca31c8d0e9cdd4697bd46f3703c7a0901edb66a6f4cf0d42",
    "email": "teste@inova.com.br"
}
```

#### Procurando frases

Para pesquiser frases na API, é necessário se autenticar com o token de usuário e fornecer um parâmetro de busca da seguinte forma:

`GET` request para o endpoint `/quotes/<search_tag>`, onde `<search_tag>` é o termo de busca, que pode ser substituido por exemplo por: love, girls e etc...

Headers: `Authorization: Token <user_token>`, onde `<user_token>` é o token de acesso do usuário criado.

A resposta será semelhante a essa:

```json
[
    {
        "quote": "“If you can make a woman laugh, you can make her do anything.”",
        "author": "Marilyn Monroe",
        "author_about": "http://quotes.toscrape.com/author/Marilyn-Monroe",
        "tags": [
            "girls",
            "love"
        ]
    }
]
```