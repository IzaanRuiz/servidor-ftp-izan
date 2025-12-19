# Desplegament d'un Servei FTP Corporatiu amb Docker i vsftpd 

**Alumne:** Izan Ruiz  
**Data:** 19/12/2025  

## 1. Introducció i Utilitat del Servei

L'FTP (File Transfer Protocol) és un protocol estàndard per a la transferència de fitxers entre sistemes connectats a una xarxa TCP. 



## 2. Anàlisi Teòrica: Modes de Connexió

Durant la pràctica he analitzat els dos modes principals:

*   **Mode Actiu:** El servidor inicia la connexió de dades des del port 20 cap al client. Sol donar problemes amb Firewalls i NAT.

*   **Mode Passiu:** El client inicia la connexió cap a un rang de ports obert pel servidor (`21100-21110`). És el mode més compatible i el que hem deixat per defecte.

*   **Seguretat:** S'ha utilitzat **vsftpd** per la seva robustesa. Hem comentat la diferència entre FTP i FTPS.



## 3. Guia de Desplegament

El servidor corre sobre Docker per garantir la portabilitat.



**Passos per aixecar el servei:**

1. Construir la imatge: `docker-compose build`

2. Iniciar el contenidor: `docker-compose up -d`

3. Verificar l'estat: `docker ps`



**Captura 1:** 
![Estat del contenidor](captures/Screenshot\_1.png)  



## 4. Configuració i Usuaris

S'ha configurat un accés anònim i tres usuaris corporatius amb diferents privilegis:



*   **Configuració de seguretat:** Tots els usuaris fan servir `/usr/sbin/nologin` com a shell per evitar accessos no desitjats al sistema operatiu.

*   **Límits de velocitat:** S'ha aplicat una configuració específica per a cada perfil:



| Usuari | Velocitat màxima | Connexions per IP |

| :--- | :--- | :--- |

| **Anònim** | 512 KB/s | 3 |

| **client1** | 512 KB/s | 2 |

| **empleat1** | 2 MB/s | 3 |



**Captura 2:** 
![Estructura de fitxers](captures/Screenshot\_2.png)  



## 5. Proves de Funcionament



### 5.1. Connexió Mode Actiu i Passiu (Tasca 13)

He realitzat proves amb el client `ftp` estàndard per comprovar el canvi de mode amb la comanda `passive`.



**Captura 3:** 
![Mode Actiu vs Passiu](captures/Screenshot\_3.png)  



### 5.2. Transferència de fitxers (Tasca 15 i 16)

S'ha provat la pujada (`put`) i descàrrega (`get`) de fitxers de prova. També s'ha utilitzat `lftp` per a operacions avançades com `du -h`.



**Captura 4:** 
![Pujada de fitxers](captures/Screenshot\_4.png)  



**Captura 5:** 
![Comandes avançades lftp](captures/Screenshot\_5.png)  



### 5.3. Prova amb FileZilla (Tasca 17)

S'ha utilitzat el client gràfic FileZilla per validar la facilitat d'ús de l'usuari final i la compatibilitat del mode passiu.



**Captura 6:** 
![Interfície FileZilla](captures/Screenshot\_6.png)  





