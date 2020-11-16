# ft_services
docker &amp;&amp; kubernetes with minikube 1.14.2

# How To Run
just execute **setup.sh**, it will run the necessary commands to setup a kubernetes cluster.
the containers available:

 - Nginx server listening on 80 and 443 ports (self signed ssl certificate), it can be accessed using ssh on port 600.
 - Phpmyadmin on port 5000
 - Wordpress on port 5050
 - mysql database on 3306
 - influxdb (for monitoring with telegraf) on port 8086
 - grafana on port 3000
 - and an FTPS server on port 21 
 
 run: `minikube ip` for the ip address to use
