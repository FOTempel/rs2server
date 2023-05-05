# Introduction
This repository is provided "as-is". Tweaking will be necessary to make it fit your particular environment or situation.

This repository can be used a guideline and it assumes you know what you're doing with stuff like Docker containers, docker-compose and nginx (used as reverse proxy for the web console). This is *not* a quick ready to go solution.

# Quickstart
1) clone this repository, enter its directory
2) edit docker-compose/docker-compose.yaml to suit your needs
3) edit nginx/* to suit your needs.
4) `docker build -t rs2server:latest .`
5) `docker-compose -f docker-compose/docker-compose.yaml up -d && docker logs -f rs2server`
6) You should see some output, hope it works

# Points to consider
* The nginx configuration is for an SSL webserver. If you don't know what this is, stop reading and go play minecraft.
* Everything the container does is put in /RS2. In the docker-compose file that /RS2 directory is volume mapped to a directory on the docker host system. If you don't want to lose your configuration or redownload the dedicated server software a lot, you really want that volume mapping.
* The nginx configuration also takes static content into account. This is useful for custom maps and stuff. See nginx/conf.d/myserver.conf for some details
* After succesfully running a server for the first time, you might want to configure it. See: [The RS2 Dedicated Server Admin Guide](https://wiki.rs2vietnam.com/index.php?title=DedicatedServer)
