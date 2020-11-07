#1 /bin/bash
#don't forget ip address problem

docker build -t mysql:mine ./srcs/mysql/
docker build -t ftps:mine ./srcs/ftps/
docker build -t nginx:mine ./srcs/nginx/
docker build -t phpmyadmin:mine ./srcs/phpmyadmin/
docker build -t wordpress:mine ./srcs/wordpress/
docker build -t grafana:mine ./srcs/grafana/
docker build -t influxdb:mine ./srcs/influxdb/


kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/ftps.yaml
kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress.yaml
kubectl apply -f ./srcs/grafana.yaml
kubectl apply -f ./srcs/influxdb.yaml