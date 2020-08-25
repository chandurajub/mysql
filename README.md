## Manual Steps to Install MySQL 

As per the Application need we are choosing MySQL 5.7 version.

1. Download and Extract MySQL 

```
# wget https://downloads.mysql.com/archives/get/p/23/file/mysql-5.7.28-1.el7.x86_64.rpm-bundle.tar 
# tar -xf mysql-5.7.28-1.el7.x86_64.rpm-bundle.tar 

```

2. Install MySQL  

```
# yum install mysql-community-client-5.7.28-1.el7.x86_64.rpm \
              mysql-community-common-5.7.28-1.el7.x86_64.rpm \
              mysql-community-libs-5.7.28-1.el7.x86_64.rpm \
              mysql-community-server-5.7.28-1.el7.x86_64.rpm -y 

```

3. Start MySQL.

```
# systemctl enable mysqld 
# systemctl start mysqld

```

4. Now a default root password will be generated and given in the log file.

```
# cat /var/log/mysqld.log

```

5. Next, We need to change the default root password in order to start using the database service.


```
# mysql_secure_installation

```
6. You can check the new password working or not using the following command.

```

# mysql -u root -p

```

## Automated Script to Install MySQL 

```
# curl -s https://raw.githubusercontent.com/linuxautomations/labautomation/master/tools/mysql/install-5.7.sh | bash

```



# Setup Needed for Application.

As per the architecture diagram, MySQL is needed by 

  - Shipping Service

  - Rating Service 


So we need to load that schema into database, So those applications will dectect them and run accordingly.

To download, Use the following command

`git clone <URL>` , URL can be fetched from GitLab, Use **HTTPS** link.

1. Load the schema for Shipping Service.

```
# cd mysql
# gunzip shipping.sql.gz
# mysql -u root -p <shipping.sql
```

2. Load the Schema for Ratings Service

```
# cd mysql 
# mysql -u root -p <ratings.sql
```

