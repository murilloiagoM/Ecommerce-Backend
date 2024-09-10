API Node.js com Fastify

Api construída com Node.js e Fastify. O objetivo é fornecer um backend eficiente para operações CRUD (Create, Read, Update, Delete) utilizando um banco de dados MySQL.

Utilização

Criar uma base de dados utilizando MySQL denominada servidornode e importar o arquivo servidornode.sql que está na raiz do projeto. Pode ser necessário alterar a string de conexão do fastifyMysql no arquivo server.js: connectionString: 'mysql://root@localhost/servidornode';

Abrir um terminal na raiz do servidor, instalar as dependencias com o comando "npm install" e em seguida digitar o comando: "npm run dev" que o servidor será executado localmente na porta 3333.

🚀 Funcionalidades

Endpoints: Suporte para rotas GET e POST.

Banco de Dados: Conectado a um banco de dados MySQL, também feito para banco de dados PostgreSQL;

Autenticação: Utiliza cookies httpOnly para gerenciamento de sessão definido pelo backend;

Upload de Arquivos: Suporte para upload de arquivos via fastify-multipart;

CORS: Configuração de CORS para permitir requisições do frontend em http://localhost:3000 a fim de evitar acessos indesejados.

🔧 Tecnologias Utilizadas

Node.js

Fastify: Framework para construir aplicações web e APIs;

Fastify Mysql e Postgres: Conexão com MySQL e PostgreSQL;

Fastify Cookie: Gerenciamento de cookies para autenticação;

Fastify Multipart: Suporte para upload de arquivos;

dotenv: Carregamento de variáveis de ambiente.