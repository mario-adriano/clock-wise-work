## Ferramentas utilizadas

- Ruby - 3.2.2
- Ruby on Rails - 7.0.8
- postgres - 15.2



## Execução

- Inicie o docker-compose-service para subir os db e o redis
  
  `sudo docker compose -f docker-compose-service.yml up`
  
- Para executar o aplicativo

  `sudo docker compose build`
  `sudo docker compose up`

- Para criar o banco e executar imigração

  `sudo docker compose exec api1 bash`

- Agora, ira entra no console do container e precisará executar os comandos abaixo:

  `rails db:create`
  `rails db:migrate`
  `rails db:seed`


- Rotas - User
# GET /api/v1/users/:id

# POST /api/v1/users

# PATCH/PUT /api/v1/users/:id

- Rotas - Project

# GET/api/v1/projects

# GET /api/v1/projects/:id

# POST /api/v1/projects
# PATCH/PUT /api/v1/projects/:id

- Rotas - TimeLog

# GET /api/v1/projects/:id/times

# POST /api/v1/time_logs
# PATCH/PUT /api/v1/time_logs/:id
