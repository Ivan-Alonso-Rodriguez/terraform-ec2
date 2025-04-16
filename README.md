# Terraform EC2
Este proyecto crea una instancia EC2 en AWS usando Terraform.
Al desplegar la infraestructura, se instalará automáticamente `nginx` y se mostrará un mensaje personalizado en el navegador al acceder a la IP pública de la instancia.

## Características
- AMI Ubuntu 22.04 (puedes cambiarla)
- Clave SSH existente (`key_name`)
- Disco de 20 GB
- Puertos abiertos: 22 (SSH) y 80 (HTTP)
- Compatible con `LabRole` en AWS Academy (no crea roles adicionales)
