# Cluster Beacon

A Docker container that can detect presence via BTLE for use in presence dection and home automation.

# Motivation

I am using [home-cluster](https://github.com/zaneclaes/home-cluster) for a cheap fleet of raspberry pis in my house. Each one acts as a [home-assistant kiosk](https://www.technicallywizardry.com/magic-spellbook-raspberry-pi-home-assistant-kiosk/). This containerized implementation of EspruinoHub and Node-Red lets each act as a "beacon."

# Installation

If you're running [home-cluster](https://github.com/zaneclaes/home-cluster) with Kubernetes, just `kubectl apply -f https://raw.githubusercontent.com/zaneclaes/cluster-beacon/master/kubernetes/home-cluster-beacon.yaml`. If you're using Kubernetes in some other manner, you may need to adjust the `nodeAffinity` values. The file contains comments which may be helpful in modifying your deployment.

# Background

My first pass at Home Assistant beacons used [monitor](https://github.com/andrewjfreyer/monitor) deployed via [host-cluster](https://github.com/zaneclaes/home-cluster) to Raspberry Pis. In the process of attempting to dockerize monitor, I discovered EsprinoHub to be a much more sophisticated BTLE -> MQTT bridge. I found an [existing dockerization](https://github.com/humbertosales/espruinohub-docker-rpi), but it was out-of-date and buggy for me. I shamelessly hacked all these pieces together using LTE supported base images and recent releases of relevant software.
