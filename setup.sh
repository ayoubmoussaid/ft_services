#1 /bin/bash

docker build -t mysql:mine ./srcs/mysql/
docker build -t ftps:mine ./srcs/ftps/
docker build -t nginx:mine ./srcs/nginx/
docker build -t phpmyadmin:mine ./srcs/phpmyadmin/
docker build -t wordpress:mine ./srcs/wordpress/


kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/ftps.yaml
kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress.yaml