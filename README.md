# DevOps Stack

This repository provides a collection of self-hosted software configurations using Docker, designed to serve as a foundational DevOps stack for any company.

## Requirements

Before you start, it is highly recommended to install the following components on your server:

- [Nginx](https://github.com/dalthonmh/scripts/blob/main/install-nginx.sh): For reverse proxying services.
- [Docker](https://github.com/dalthonmh/scripts/blob/main/install-docker.sh): For running the containerized applications.
- [HTTPS](https://github.com/dalthonmh/scripts/blob/main/install-https.sh): For securing your services with SSL/TLS certificates.

## Included Software

This stack includes the following components, each located in its own directory:

- **[Jenkins](./jenkins/)**: An open-source automation server that helps automate the parts of software development related to building, testing, and deploying, facilitating continuous integration and continuous delivery.

- **[JFrog Artifactory](./jfrog/)**: A universal artifact repository manager. It provides a single source of truth for all your packages, container images, and Helm charts as you move across the entire DevOps pipeline.

- **[Docker Registry](./registry/)**: A scalable and stateless server that lets you store and distribute Docker images. Use it to manage your private container images. See the [setup instructions](./registry/README.md).

- **[Taiga](./taiga-docker/)**: An agile project management platform. It's intuitive and simple, with a rich feature set. See the [setup instructions](./taiga-docker/fork/README.md).

## Getting Started

Each component is containerized and can be configured and deployed independently. Navigate to the respective directory for each tool to find its `docker-compose.yml` file and specific instructions. You will typically need to configure environment variables before launching the services.

## Contact

This stack was created by [dalthonmh](mailto:dalthonmh@gmail.com).
