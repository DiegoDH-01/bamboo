FROM atlassian/bamboo-server:latest

# Copiar el driver JDBC al directorio de Bamboo
COPY postgresql-42.7.6.jar /opt/atlassian/bamboo/lib/
