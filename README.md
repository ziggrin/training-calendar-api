# Training Calendar API

This is a Ruby on Rails application that provides a backend API for managing a training calendar. It runs Puma as its application server (`bundle exec puma -C config/puma.rb`).

In production (or preproduction), the app is deployed as an ECS Fargate task behind a load balancer, handling API requests for the training calendar service.

## Some of the Cool Features

- **CI/CD Workflows:** Check out the continuous integration and deployment workflows.
- **Nginx Reverse Proxy:** Nginx is used as a reverse proxy with an HTML5 Boilerplate (H5BP) configuration.
- **Secret Management:** In preproduction/production, sensitive data is served from AWS Parameter Store via [Chamber](https://github.com/segmentio/chamber).

## Getting Started with Development

To start development, all you need is:
- Docker Desktop installed (or a standard Docker installation—Docker Compose is used in this project).
- Navigate to the `.dockerdev` folder and run:

```bash
docker compose up
```
## Frontend

**Repository:** [https://github.com/ziggrin/training-calendar-frontend](https://github.com/ziggrin/training-calendar-front)

It might be easier (or preferred) to run the frontend on your local machine using your local Node.js installation. Simply navigate to the frontend directory and run:

```bash
npm start
```

Alternatively, you can run the frontend as a Docker container:

- Clone the frontend GitHub repository into the project’s main directory.
- Uncomment the react service section in `docker-compose.yml`. This will allow Docker to run the frontend container, which can then connect to the backend.

Enjoy.
