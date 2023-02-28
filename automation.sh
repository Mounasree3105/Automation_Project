This is an automation script

sudo apt update -Y
sudo apt install apache2
sudo systemctl start apache2
sudo systemct1 enable apache2


timestamp=$(date '+%d%m%Y-%H%M%S')
name="Mounasree"
s3_bucket="upgrad-mounasree"
tar -cvf /tmp/$name-httpd-logs-$timestamp.tar /var/log/apache2/*.log
aws s3 cp /tmp/$name-httpd-logs-$timestamp.tar s3://$s3_bucket/$name-httpd-logs-$timestamp.tar
