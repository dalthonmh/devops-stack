# Instructions

To generate the registry password use:

```sh
sudo apt install apache2-utils   # if you don't have `htpasswd`
htpasswd -B /srv/docker-registry/config/htpasswd admin
```

Log in:

```sh
docker login docker.dalthonmh.com
```
