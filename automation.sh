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



file_path="/tmp/$name-httpd-logs-$timestamp.tar"
file_size=$(stat -c%s "$file_path")


if [ -e /var/www/html/inventory.html ]; then
    echo -e "httpd-logs  ${timestamp}  tar  ${file_size}" >> /var/www/html/inventory.html
else
    echo "Log Type      Date Created   Type  Size" > /var/www/html/inventory.html
fi


if [ -e /etc/cron.d/automation ]; then
 echo "Cron job Running"
else


    

    echo "0 0 * * * root /root/Automation_Project/automation.sh" > /etc/cron.d/automation

    echo "Cron job started"
fi
