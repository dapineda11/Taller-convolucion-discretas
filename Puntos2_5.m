%% Actividad 2- Función propia convolución

k=0:5;
u=(k.^2)-4;
l=k+3;
N=length(u);
q=length(l);
rs=N+q-1;
Xa_K=fft(u,rs);
Xb_K=fft(l,rs);
Xc_K=Xa_K.*Xb_K;
x3=ifft(Xc_K);

% Prueba
convolucion=conv(u,l);


 %% ACTIVIDAD 3 Laboratorio de audio
m=audioread('C:\Users\estudiante\Downloads\Styx-Renegade.wav')


%1. ¿Que caracter?sticas tiene el audio grabado en matlab?,e.g. como esta almacenado en
%memoria? que tipo de datos usa? cuantos canales puede manejar y como se representan
%los canales?

%*El archivo analizado evidencia serie de muestras que guardan la amplitud 
%del sonido a lo largo del tiempo.La tarifa de la muestra es el número de 
%muestras discretas tomadas por segundo en unidades de Hertz y se muestra 
%como "value". 

%*Las funciones de audio en general, son leídas y almacenadas de acuerdo a 
%el ó los canales en que se hallen los datos de audio de un solo canal (mo-
%no) en un solo vector columna, y los datos estéreo en 2 vectores. Para los
%datos éstos últimos,la primera columna contiene el canal izquierdo, y la 
%segunda columna contiene el canal derecho.Como suele ser en de la mayoría 
%de canciones.En este caso cada muestra es un valor de doble precisión 
%entre-1 y 1.

%2. Use la funcion sound o audioplayer o play para reproducir el audio. Cambie la frecuen-
%cia de muestreo, al doble, a la mitad, y reproduzca nuevamente.


sound (m,21500);

sound (m,88200);


% 3. Use la funcion downsample para diezmar, de tal manera que se reprodu-
%zca la señal de
%manera correcta.
h=downsample(m,5);
sound(h,8820);
%*De lo anterior se puede concluir que mengua la tasa de muestreo de el 
%audio guardado en m, manteniendo la primera muestra y luego cada numero 
%(n) de muestras después de la primera. Por lo que se pierde calidad de 
%manera muy notable al reproducirla ya que la frecuencia utilizada en la
%reproducción debe ser reducida tantas (n) veces como se haya diezmado


%4. Investigue como invertir el audio e invierta la senal, reproduzca el audio invertido.
h1=flip(m);
sound(h1,44100);

%5. Grafique la parte par y la parte impar del audio.
%Inicialmente debe partirse el audio, de tipo estéreo (2 columnas) en
%partes separadas:

c1a=m(:,1);
c2a=m(:,2);
%Ahora empleamos la ecuación para la parte par e impar de toda senal para
%cada una de las dos columnas
t=0:873529;

%Partimos de rotar en tiempo cada muestra de la columna 1 
mtt1=[flip(c1a(t>=0)) flip(c1a(t<0))];
xp1=0.5*(mtt1+c1a);
xim1=0.5*(c1a-mtt1);

subplot(2,5,1),plot(t,c1a);
title('Audio Original-Renegade');
subplot(2,5,2), plot(t,xp1);
title('Parte par columna 1');
subplot(2,5,3), plot(t,xim1);
title('Parte impar columna 1');

%Realizamos lo mismo para la columna 2
mtt2=[flip(c2a(t>=0)) flip(c2a(t<0))]
xp2=0.5*(mtt2+c2a)
xim2=0.5*(c2a-mtt2)
subplot(2,5,4), plot(t,c2a);
title('Audio Original-Renegade2'),
subplot(2,5,5), plot(t,xp2);
title('Parte par columna 2')
subplot(2,5,6), plot(t,xim2);
title('Parte impar columna 2');


%% ACTIVIDAD 4 Respuesta a impulso
xn=audioread('C:\Users\estudiante\Downloads\male-voice-oh-yeah.wav');
rn=audioread('C:\Users\estudiante\Downloads\Localizacion-impulse-response.wav');

k12=0:227496;

XX1=length(xn);
RRN=length(rn);
movtiempo=XX1+(RRN-1);
Xxx1_K=fft(xn,movtiempo);
Xrn_K=fft(rn,movtiempo);
Xc1_K=Xxx1_K.*Xrn_K;
rta= ifft(Xc1_K);

subplot(2,1,1), plot(rta);
title ('funcion propia');

%Prueba, rta impulso
%Graficamos tanto la prueba como

convsenales=conv(xn,rn);

subplot(2,1,2), plot(convsenales);
title ('prueba');
%% Actividad 5. Desplazamiento en el tiempo
%1. Se deben generar los cinco archivos .WAV en los cuales se escuche procedente de cada
%punto espacial.



%
%                                            ((##                                                   
%                                           *    #                                                  
%                                           %    (                                                  
%                                                                                                   
%                                             . .                                                   
%                .                           .   .                      ..                          
%              %    %                       .     .                   %    %                        
%              .    #                      .       ,                  (    (                        
%               (%&, .                    .         .                  *%%(                         
%                       .                .           .                 .                            
%                     .    .            ,             .             .  .                            
%                             ..       .               .        .     .                             
%                      .          .   .                 .   ..                                      
%                       .            ,  /*/**,,/...,           ,                              
%                                   . .*.            .,.                                            
%                        .         .,.      .     .     ,           .                               
%                                 .,          .,                   .                                
%                         .      ..        .      .        .                                        
%                          .    .,     ..             .     ,     .                                 
%   &. .&                      ,*   .                    .       .                                  
%  %     (                  . , ..                          .*..                        #  .(       
%   %   #  ..................,...............................,.,,..................... #    ..      
%                           * ,,                                ,                       &  /,       
%                              ,                               .*                                   
%                              .                             .                                      
%                               ,                            ,                                      
%                                *                          ,                                       
%                                  .                      ,                                         
%                                     *       ,,      ,,                                            
%                                                                                                   


%2. Indicar la respuesta impulso de cada uno de los cinco sistemas para la oreja izquierda
%y la oreja derecha (10 en total).
clear all;
close all;
clc;

Fs = 44100;
t = 3;
v = audiorecorder(Fs, 16, 1);

%v.StartFcn = 'disp(''   iniciando grabación'')';
%v.StopFcn = 'disp(''   terminando grabación'')';

%input ('Grabe su voz durante 3 segundos (Luego de presionar la tecla "ENTER")'); 
recordblocking(v, t)
y = v.getaudiodata()
audiowrite ('test1.wav',y,Fs); 
sound(y, Fs)


ap1 =audioplayer (y,Fs);
stem(y);

delay=zeros(100000,1)

izq=[y;delay]
der=[delay;y]

allsslf=[izq der]

tam=size(der,1)/Fs;

reprod=audioplayer(allsslf,Fs);

play(reprod);
%%
ret1=zeros(1000000,1)

izq1=[y;ret1]
der1=[ret1;y]

allsslf1=[izq1 der1]

tam1=size(der1,1)/Fs;

reprod1=audioplayer(allsslf1,Fs);

play(reprod1);
%%
ret2=zeros(10000,1)

izq2=[y;ret2]
der2=[ret2;y]

allsslf2=[izq2 der2]

tam2=size(der2,1)/Fs;

reprod2=audioplayer(allsslf2,Fs);

play(reprod2);
%%
ret3=zeros(1000,1)

izq3=[y;ret3]
der3=[ret3;y]

allsslf3=[izq3 der3]

tam3=size(der3,1)/Fs;

sound(allsslf3,Fs)
