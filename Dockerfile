# Usa la imagen oficial de Nginx como base
FROM nginx:alpine

# Elimina la configuración por defecto de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copia los archivos de la página web al directorio de Nginx
COPY . /usr/share/nginx/html

# Crea los directorios necesarios y asigna permisos
RUN mkdir -p /var/cache/nginx/client_temp && \
    chmod -R 777 /var/cache/nginx

# Monta un volumen temporal
VOLUME /var/cache/nginx

# Expone el puerto 8080 para OpenShift
EXPOSE 8080

# Cambia la configuración de Nginx para usar el puerto 8080
RUN sed -i 's/80/8080/g' /etc/nginx/conf.d/default.conf

# Comando para ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]


