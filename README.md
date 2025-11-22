# DevOps Stack

This repository provides a collection of self-hosted software configurations using Docker, designed to serve as a foundational DevOps stack for any company.

## Requirements

Before you start, it is highly recommended to install the following components on your server:

- [Nginx](https://github.com/dalthonmh/scripts/blob/main/install-nginx.sh): For reverse proxying services.
- [Docker](https://github.com/dalthonmh/scripts/blob/main/install-docker.sh): For running the containerized applications.
- [HTTPS](https://github.com/dalthonmh/scripts/blob/main/install-https.sh): For securing your services with SSL/TLS certificates.

## Included Software

This stack includes the following components, each located in its own directory:

- **[Jenkins](./jenkins/)**: An open-source automation server that facilitating CI/CD.
- **[JFrog Artifactory](./jfrog/)**: A universal artifact repository manager.
- **[Docker Registry](./registry/)**: A scalable and stateless server that lets you store and distribute Docker images.
- **[Taiga](./taiga-docker/)**: An agile project management platform. It's intuitive and simple.

## Contact

This stack was created by [dalthonmh](mailto:dalthonmh@gmail.com).
