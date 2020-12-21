kubectl delete -f ./srcs/mysql.yaml
kubectl delete -f ./srcs/ftps.yaml
kubectl delete -f ./srcs/nginx.yaml
kubectl delete -f ./srcs/phpmyadmin.yaml
kubectl delete -f ./srcs/wordpress.yaml
kubectl delete -f ./srcs/grafana.yaml
kubectl delete -f ./srcs/influxdb.yaml

sleep 3

docker rmi -f mysql:mine 
docker rmi -f ftps:mine 
docker rmi -f nginx:mine 
docker rmi -f phpmyadmin:mine 
docker rmi -f wordpress:mine 
docker rmi -f grafana:mine
docker rmi -f influxdb:mine

