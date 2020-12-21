#1 /bin/bash
#don't forget ip address problem


echo -e "\033[36m
███████╗████████╗   ███████╗███████╗██████╗ ██╗   ██╗██╗ ██████╗███████╗███████╗
██╔════╝╚══██╔══╝   ██╔════╝██╔════╝██╔══██╗██║   ██║██║██╔════╝██╔════╝██╔════╝
█████╗     ██║█████╗███████╗█████╗  ██████╔╝██║   ██║██║██║     █████╗  ███████╗
██╔══╝     ██║╚════╝╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║     ██╔══╝  ╚════██║
██║        ██║      ███████║███████╗██║  ██║ ╚████╔╝ ██║╚██████╗███████╗███████║
╚═╝        ╚═╝      ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝ ╚═════╝╚══════╝╚══════╝"

echo -e "\033[92mChanging IP Address in files"

minikube start

IPADDRESS=$(minikube ip)

find ./srcs -type f  | while read line
do 
    sed -i '' "s/URLHERE/$IPADDRESS/g" $line
done

eval $(minikube -p minikube docker-env)

echo -e "\033[92mBuilding Images using Dockerfiles"

docker build -t influxdb:mine ./srcs/influxdb/
docker build -t mysql:mine ./srcs/mysql/
docker build -t ftps:mine ./srcs/ftps/
docker build -t nginx:mine ./srcs/nginx/
docker build -t phpmyadmin:mine ./srcs/phpmyadmin/
docker build -t wordpress:mine ./srcs/wordpress/
docker build -t grafana:mine ./srcs/grafana/

echo -e "\033[92mRunning the deployements and services"
kubectl apply -f ./srcs/influxdb.yaml
kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/ftps.yaml
kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress.yaml
kubectl apply -f ./srcs/grafana.yaml

echo -e "\033[92mI will launch the kubernetes dashboard for you"
minikube dashboard
