# Define la imagen base
FROM node:14.17.0-alpine3.13

# Establece el directorio de trabajo
WORKDIR /app

# Copia el código de la aplicación al contenedor
COPY ./ .

# Instala las dependencias del proyecto
RUN npm install
RUN npm install -g @angular/cli

# Expone el puerto
EXPOSE 5000

# Define el comando de inicio de la aplicación
CMD ["ng", "serve"]