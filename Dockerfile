# Usa la imagen base de Nginx basada en UBI8 proporcionada por Red Hat
FROM registry.access.redhat.com/ubi8/nginx-120:latest

# Copia los archivos HTML al directorio de Nginx
COPY *.html /usr/share/nginx/html/

# Configura permisos para compatibilidad con OpenShift
USER 1001

# Expone el puerto 8080 para OpenShift
EXPOSE 8080

# Ejecuta Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
