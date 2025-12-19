FROM ubuntu:24.04

# Informació del mantenidor
LABEL maintainer="izan.ruiz@techfiles.sl"
LABEL description="Servidor FTP corporatiu amb vsftpd"

# Instal·lació de vsftpd i utilitats
RUN apt-get update && \
    apt-get install -y vsftpd ftp db-util && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Creació de directoris necessaris
RUN mkdir -p /var/run/vsftpd/empty && \
    mkdir -p /home/ftpusers && \
    mkdir -p /var/ftp/public

# Configuració de permissions per l'accés anònim
RUN mkdir -p /var/ftp/public && \
    chown -R ftp:ftp /var/ftp && \
    chmod 755 /var/ftp/public

# Port 21: control
# Ports 21100-21110: mode passiu
EXPOSE 21 21100-21110

# Comando d'inici
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]