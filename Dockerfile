FROM atlassian/bamboo-server:latest

USER root

# Instalar dependencias necesarias y Docker + Compose plugin
RUN apt-get update && \
    apt-get install -y ca-certificates curl gnupg lsb-release software-properties-common apt-transport-https && \
    mkdir -m 0755 -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Dar permiso al usuario bamboo para ejecutar docker
RUN usermod -aG docker bamboo

# (Opcional) Copiar el driver JDBC si usas PostgreSQL
COPY postgresql-42.7.6.jar /opt/atlassian/bamboo/lib/

# Volver al usuario de Bamboo
USER bamboo
