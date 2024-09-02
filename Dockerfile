# Usa la imagen base de Nginx basada en UBI8 proporcionada por Red Hat
FROM registry.access.redhat.com/ubi8/nginx-120:latest

# Copia los archivos HTML al directorio de Nginx
COPY *.html /usr/share/nginx/html/

# Copia la configuración de Nginx personalizada
COPY nginx.conf /etc/nginx/nginx.conf

# Cambia el usuario para ejecutar Nginx con permisos limitados
USER 1001

# Expone el puerto 8080 para OpenShift
EXPOSE 8080

# Ejecuta Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]

