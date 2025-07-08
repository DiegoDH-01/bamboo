FROM atlassian/bamboo-server:latest

USER root

# Copiar driver JDBC si usas PostgreSQL
COPY postgresql-42.7.6.jar /opt/atlassian/bamboo/lib/

# Dar permisos para acceder al socket
RUN groupadd docker && usermod -aG docker bamboo

USER bamboo
