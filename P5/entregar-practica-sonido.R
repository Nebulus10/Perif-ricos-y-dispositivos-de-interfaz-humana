
# install.packages('tuneR', dep=TRUE)
# install.packages('seewave', dep=TRUE)
# install.packages('soundgen', dep=TRUE)

library(tuneR)
library(seewave)
library(audio)

# establecer el path concreto en cada caso a la carpeta de trabajo
setwd("/home/angel/P5/")

# cargar archivos de sonido (wav/mp3):
nombre <- readWave('fichero1.wav')
nombre
apellidos <- readWave('fichero2.wav')
apellidos

# mostrar los campos del archivo de sonido
str(nombre)
str(apellidos)

# calcular la duración exacta del sonido (con tres decimales)
round(length(nombre@left) / nombre@samp.rate, 3)
round(length(apellidos@left) / apellidos@samp.rate, 3)

f <- nombre@samp.rate    #44100

# escuchar un sonido (NO ESTA FUNCIONANDO):
listen(nombre,f=f)
listen(apellidos,f=f)

# mostrar la onda del sonido:
plot( extractWave(nombre, from = 1, to = 31085) )
plot( extractWave(apellidos, from = 1, to = 27002) )

# Union de segmentos:
s3 <- pastew(apellidos, nombre, output="Wave")
s3
plot( extractWave(s3, from = 1, to=265573) )
listen(s3)

# Filtro de frecuencia

s4 <- bwfilter(s3,f=f, channel=1, n=1, from=10000/2, to=20000/2, bandpass=TRUE, listen = FALSE, output = "Wave")
listen(s4,f=f)

# Escribir nuevo archivo WAV

writeWave(s4, file.path("nombre-y-apellido.wav") )

# Carga, ECO, REVERSE:
nombreyappellido <- readWave('nombre-y-apellido.wav')
nombreyappellido

nombreyappellidoECO <- echo(nombreyappellido,f=22050,amp=c(0.8,0.4,0.2),delay=c(1,2,3),
                output="Wave")
nombreyappellidoECO@left <- 10000 * nombreyappellidoECO@left
listen(nombreyappellidoECO , f= 22050)
str(nombreyappellidoECO)
plot( extractWave(nombreyappellidoECO, from = 1, to = 124237) )
writeWave(nombreyappellidoECO, file.path("nombreyappellidoECO.wav") )

nombreyappellidoREVERSE <- readWave('nombreyappellidoECO.wav')
nombreyappellidoREVERSE

alreves <- revw(nombreyappellidoREVERSE, output="Wave")
writeWave(alreves, file.path("alreves.wav") )
