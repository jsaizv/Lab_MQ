# Laboratorio de IBM MQ 9.1

Este laboratorio consta de 2 máquinas virtuales de CentOS 8:

 - mqCliente - Servidor con el cliente de IBM MQ despleagado mediante docker. Se encargara de simular el envío.
 - mqServer - Servidor con el server de IBM MQ despleagado mediante docker. Se encargará de la recepción.

## Pre-requisitos 📋

 - VirtualBox.
 - Vagrant.

## Despliegue 🔧

### Ejecución

Desde la CMD:

$ cd (carpeta del laboratorio)
$ vagrant up

### mqCliente

Se desplegará un box de CentOS 8 y se le asignará la IP 10.0.0.7 de la red interna. Una vez arrancado el servidor se ejecutará el script de provisión.

Dicho script instalará el Docker CE y se descargará la demo oficial de IBM para simular el cliente de MQ y creará la imagen de docker para su posterior utilización.

### mqServer

Se desplegará un box de CentOS 8, se le asignará la IP 10.0.0.8 de la red interna y se le configurará el port forwarding para que desde el ordenador anfitrión se pueda conectar a la web de administración del IBM MQ queue manager. Una vez arrancado el servidor se ejecutará el script de provisión.

Dicho script instalará el Docker CE y se descargará la imagen oficial de IBM el servidor de MQ y arrancará una instancia de docker de dicha imagen. 

## Tests ⚙️

Para simular una conexión nos conectaremos al mqCliente desde la CMD:

$ cd (carpeta del laboratorio)
$ vagrant ssh mqCliente

Una vez en el servidor ejecutaremos lo siguiente:

$ sudo docker run --network mq-demo-network -ti mq-demo

Tras lanzarlo, cargará una interfaz y te realizará una serie de preguntas, únicamente hay que rellenar el paso 2 con el valor "10.0.0.8" y el último paso con la contraseña del usuario de aplicación, que es "test123".

Una vez realizado todo, te devolverá una subshell del IBM MQ.

Para realizar los tests vale con ejecutar varios comandos de chequeo:

```
put 6

ó 

get 6
```

Para la comprobación del funcionamiento, nos conectaremos a la consola de IBM MQ queue manager. Para ello nos conectaremos a la siguiente URL:

https://localhost:9443/ibmmq/console/

Las credenciales son "admin:passw0rd".

## Referencias 📄

https://developer.ibm.com/messaging/learn-mq/mq-tutorials/mq-connect-to-queue-manager/#docker

## Autores ✒️

* **Javier Saiz Villares** - [EDNON S.L](javier.saiz@ednon.es)