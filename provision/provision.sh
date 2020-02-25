sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf -y install --nobest docker-ce
sudo systemctl start docker
sudo docker volume create qm1data
sudo docker network create mq-demo-network
case "$1" in 
	'server')
	sudo docker pull ibmcom/mq:latest
	sudo docker run --env LICENSE=accept --env MQ_QMGR_NAME=QM1 --volume qm1data:/mnt/mqm --publish 1414:1414 --publish 9443:9443 --network mq-demo-network --network-alias qmgr --detach --env MQ_APP_PASSWORD=test123 ibmcom/mq:latest
	;;

	'cliente')
	sudo wget -q --no-check-certificate https://raw.githubusercontent.com/ibm-messaging/mq-dev-samples/master/gettingStarted/mq-demo-client-application/Dockerfile
	sudo docker build -t mq-demo .
	;;
esac