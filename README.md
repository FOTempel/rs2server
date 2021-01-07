# Introduction

This repository is provided "as-is". Tweaking will be necessary to make it fit your particular environment or situation.

This repository can be used a guideline and it assumes you know what you're doing with stuff like Docker containers, docker-compose and nginx (used as reverse proxy for the web console). This is not a quick start, dummy proof, works works wherever, whenever, for whoever.

# Quickstart

1) clone this repository, enter its directory
2) edit docker-compose/docker-compose.yaml to suit your needs
3) edit nginx/* to suit your needs. Point to consider: This configuration is for an SSL webserver. If you don't know what this is, stop reading and go play minecraft.
4) `docker build -t rs2server:latest .`
5) `docker-compose -f docker-compose/docker-compose.yaml up -d && docker logs -f rs2server`
6) You should see some output, hope it works


