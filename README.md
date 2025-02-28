# Training Calendar API

This is a Ruby on Rails application that provides a backend API for managing a training calendar. It runs Puma as its application server (with the command bundle exec puma -C config/puma.rb).

In production (or preprod), it’s deployed as an ECS Fargate task behind a load balancer, handling API requests for training calendar service.

## Some of the cool things:
- checkout CI/CD in workflows,
- Nginx works as a reverse proxy with H5BP configuration,
- in pre/production sensitive data is being served from AWS Parameter Store by [Chamber]("https://github.com/segmentio/chamber")


## To start development all you need is:
- simply installed docker desktop (the regular docker works as well, tho we're using docker compose here),
- go into .dockerdev folder and run **docker compose up**.

## Frontend
#### Repo: https://github.com/ziggrin/training-calendar-frontend
#### It might be easier/prefered to run frontend on your local machine simply using your local node: 
- **npm start**

#### Though it is possible to run front as a docker container as well:
- clone frontend github repo into project main path,
- uncomment the **react** service section from docker-compose.yml. This should be enough for docker to run your frontend in container and for it to be able to connect with backend.

Enjoy.
