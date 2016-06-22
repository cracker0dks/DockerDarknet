#!/bin/bash
echo "Building Docker Image"
docker build -t dockerdarknet .

echo "Remove old Containers"
docker rm -f darknet 2>/dev/null

echo "Run new Container"
nvidia-docker run -td -p 80:80 -v /opt/DockerDarknet:/opt/DockerDarknet --name "darknet" dockerdarknet
echo "Clone repo inide Docker"
nvidia-docker exec darknet /bin/sh -c "cp -r /home/DockerDarknet /opt;rm -r DockerDarknet;cd /opt/DockerDarknet;git pull;make"

echo "Installation Complete! Now use the scripts!"
