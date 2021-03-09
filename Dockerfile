FROM mysql:8
#  
RUN echo "default-authentication-plugin=mysql_native_password" >> /etc/mysql/my.cnf
COPY oms_db_config.sql /docker-entrypoint-initdb.d/ 
RUN chmod 755 /docker-entrypoint-initdb.d/oms_db_config.sql 