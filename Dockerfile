# Usa una imagen base de Nginx proporcionada por Red Hat para OpenShift
FROM registry.redhat.io/rhel8/nginx-120:1-152.1695817066

# Elimina la configuración por defecto de Nginx
USER root
RUN rm -rf /var/lib/nginx/html/*

# Copia los archivos de la página web al directorio de Nginx
COPY . /var/lib/nginx/html

# Copia la configuración modificada de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Ajusta los permisos para compatibilidad con OpenShift
RUN chown -R 1001:0 /var/lib/nginx/html /etc/nginx/nginx.conf

# Cambia el usuario para ejecutar Nginx con permisos limitados
USER 1001

# Expone el puerto 8080 para OpenShift
EXPOSE 8080

# Comando para ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]



