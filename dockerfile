# Usa una imagen base con el Java Runtime Environment (JRE).
FROM openjdk:11-jre-slim

# Instala el sistema X11 y sus dependencias
# RUN apt-get update && apt-get install -y \
#     xvfb \
#     libxtst6 \
#     libxrender1 \
#     fontconfig \
#     libfreetype6 \
#     && rm -rf /var/lib/apt/lists/*

# Establece el directorio de trabajo dentro del contenedor.
WORKDIR /src

COPY . /src
