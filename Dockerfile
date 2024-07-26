FROM mysql:9.0.0

# Install envsubst
RUN apt-get update && apt-get install -y gettext-base

# Copy the initialization template and script into the container
COPY init_template.sql /docker-entrypoint-initdb.d/
COPY generate_init.sh /docker-entrypoint-initdb.d/

# Run the script to generate the init.sql with actual environment variables
RUN chmod +x /docker-entrypoint-initdb.d/generate_init.sh
RUN /docker-entrypoint-initdb.d/generate_init.sh

# Copy the MySQL configuration file into the container
COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf