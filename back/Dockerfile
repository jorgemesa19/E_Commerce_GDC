# Define la imagen base
FROM node:18

# Establece el directorio de trabajo
WORKDIR /app

# Copia el código de la aplicación al contenedor
COPY ./ .

# Instala las dependencias del proyecto
RUN npm install
RUN npm install nodemon

# Expone el puerto
EXPOSE 4201

# Define el comando de inicio de la aplicación
CMD ["npm", "start", "--host", "0.0.0.0"]