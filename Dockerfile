# Usa la imagen base de Nginx basada en UBI8 proporcionada por Red Hat
FROM registry.access.redhat.com/ubi8/nginx-120:latest

# Elimina la configuración por defecto de Nginx
USER root
RUN rm -rf /usr/share/nginx/html/*

# Copia los archivos de la página web al directorio de Nginx
COPY . /usr/share/nginx/html

# Copia la configuración modificada de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Ajusta los permisos para compatibilidad con OpenShift
RUN chown -R 1001:0 /usr/share/nginx/html /etc/nginx/nginx.conf

# Cambia el usuario para ejecutar Nginx con permisos limitados
USER 1001

# Expone el puerto 8080 para OpenShift
EXPOSE 8080

# Comando para ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]




