# Usa una imagen base con el Java Runtime Environment (JRE).
FROM openjdk:11-jre-slim

# Instala el sistema X11 y sus dependencias (Xvfb, bibliotecas de fuentes, etc.).
RUN apt-get update && apt-get install -y \
    xvfb \
    libxtst6 \
    libxrender1 \
    fontconfig \
    libfreetype6 \
    && rm -rf /var/lib/apt/lists/*

# Establece el directorio de trabajo dentro del contenedor.
WORKDIR /src

# Copia tu archivo JAR en el contenedor.
COPY . /src

# Define el comando para ejecutar tu aplicación.
# Usa 'xvfb-run' para ejecutar la aplicación con un servidor de visualización virtual.
# CMD ["xvfb-run", "--server-num=99", "java", "-jar", "tu-programa.jar"]

#FROM horuszup/horusec-cli:v2.9.0-beta.3

#RUN apk add --no-cache docker jq

#COPY validate_thresholds.sh /usr/local/bin/validate_thresholds.sh
#RUN chmod +x /usr/local/bin/validate_thresholds.sh



#WORKDIR /src
#COPY . .

#CMD ["sh", "-c", "\
#    horusec start \
#        -i=**./horusec/** \
#        --project-path /src \
#        --container-bind-project-path=$HOST_PROJECT_PATH/src \
#        -o=json \
#        -O /src/.horusec/output.json \
#        --log-level=debug && \
#    validate_thresholds.sh"]
