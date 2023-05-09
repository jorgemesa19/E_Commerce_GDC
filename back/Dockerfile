# Define la imagen base
FROM node:18

# Establece el directorio de trabajo
WORKDIR /app

# Copia el código de la aplicación al contenedor
COPY ./ .

# Instala las dependencias del proyecto
RUN npm install

# Expone el puerto
EXPOSE 4200

# Define el comando de inicio de la aplicación
CMD ["npm", "start"]