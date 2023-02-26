function l19011029()
  
  clc;
  clearvars;
  close all;
   
  n = input('x1 boyutunu girin(n): ');
  m = input('x2 boyutunu girin(m): ');
  x1 = input('Ilk grafigin degerlerini girin (y ekseni): ');
  tx1 = input('Grafigin zaman degerlerini girin (x ekseni): ');
  x2 = input('Ikinci grafigin degerlerini girin (y ekseni): ');
  tx2 = input('Grafigin zaman degerlerini girin (x ekseni): ');
  
        %%SORU 1%%
  y = MyConv(x1, n, x2, m); 
  a = tx1(1)+tx2(1);
  b = n+m-1;
  ty = a:a+b-1;
  
  subplot(6,4,1); 
  stem(tx1, x1,'-r','LineWidth',1.5);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('x1');
  grid on;

  disp('x1[n] = ');
  disp(x1);

  subplot(6,4,2); 
  stem(tx2, x2,'-r','LineWidth',1.5);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('x2');
  grid on;

  disp('x2[n] = ');
  disp(x2);

  subplot(6,4,3); 
  stem(ty, y, '-r','LineWidth',1.5);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('x1*x2 (MyConv fonk. ile)');
  grid on;

  disp('x1*x2 (MyConv) = ');
  disp(y);
  
        %%SORU 2%%
  c = conv(x2 ,x1);

  subplot(6,4,4); 
  stem(ty, c, '-r','LineWidth',1.5);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('x1*x2 (Hazır fonk. ile)');
  grid on;
 
  disp('x1*x2 (conv) = ');
  disp(c);
  
        %%SORU 3%%
   % 5 Saniye Ses kaydetme
  recObj = audiorecorder; 
  disp('Start speaking.') 
  recordblocking(recObj, 5);    
  disp('End of Recording.'); 
  x1 = getaudiodata(recObj);  
  
  disp('Kaydettiginiz 5 saniyelik ses');
  sound(x1);

  subplot(6,4,5); 
  stem(x1, '-g','LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('5 snlik ses');
  grid on;

  pause(5);

   % 10 Saniye Ses kaydetme
  recObj = audiorecorder; 
  disp('Start speaking.') 
  recordblocking(recObj, 10); 
  disp('End of Recording.'); 
  x2 = getaudiodata(recObj);
  
  disp('Kaydettiginiz 10 saniyelik ses');
  sound(x2);

  subplot(6,4,6); 
  stem(x2,'LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('10 snlik ses');
  grid on;

  pause(5);
  
  
        %%SORU 4%%

   
    %%M=2 için
    d = zeros(1, 801);
    d(1) = 1;
    d(400)=0.8;
    d(800)=1.6;
    
  subplot(6,4,7); 
  stem(d,'-g','LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('y[n] = x[n] + Ʃ 0.8.k.x[n-400.k] k=2');
  grid on;
  
  m = length(x1);
  n = length(d);
  
  My_Y1 = MyConv(d, n, x1, m);
  Y1 = conv(d ,x1);
  
  disp('5 saniyelik sesin m=2 için myconv ile konv. yapilmis hali.');
  sound(My_Y1);

  subplot(6,4,8); 
  stem(My_Y1, '-g','LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('5 snlik ses m=2 (MyConv fonk. ile)');
  grid on;

  pause(5);

  disp('5 saniyelik sesin hazır fonksiyonla konv. yapilmis hali.');
  sound(Y1);

  subplot(6,4,9); 
  stem(Y1,'-g','LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('5 snlik ses (Hazır fonk. ile)');
  grid on;

  pause(5);


  subplot(6,4,10); 
  stem(d,'LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('y[n] = x[n] +Ʃ 0.8.k.x[n-400.k] k=2');
  grid on;
  
  m = length(x2);
  
  My_Y2 = MyConv(d, n, x2, m);
  Y2 = conv(d ,x2);
  
  disp('10 saniyelik sesin m=2 için myconv ile konv. yapilmis hali.');
  sound(My_Y2);

  subplot(6,4,11); 
  stem(My_Y2,'LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('10 snlik ses m=2 (MyConv fonk. ile)');
  grid on;

  pause(10);

  disp('10 saniyelik sesin hazır fonksiyonla konv. yapilmis hali.');
  sound(Y2);

  subplot(6,4,12); 
  stem(Y2,'LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('10 snlik ses (Hazır fonk. ile)');
  grid on;

  pause(10);
 
    %%M=3 için
    d = zeros(1, 1201);
    d(1) = 1;
    d(400)=0.8;
    d(800)=1.6;
    d(1200)=2.4;
  
  subplot(6,4,13); 
  stem(d,'-g','LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('y[n] = x[n] + Ʃ 0.8.k.x[n-400.k] k=3');
  grid on;
  
  m = length(x1);
  n = length(d);
  
  My_Y1 = MyConv(d, n, x1, m);
  Y1 = conv(d ,x1);
  
  disp('5 saniyelik sesin m=3 için myconv ile konv. yapilmis hali.');
  sound(My_Y1);

  subplot(6,4,14); 
  stem(My_Y1, '-g','LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('5 snlik ses m=3 (MyConv fonk. ile)');
  grid on;

  pause(5);

  disp('5 saniyelik sesin hazır fonksiyonla konv. yapilmis hali.');
  sound(Y1);

  subplot(6,4,15); 
  stem(Y1,'-g','LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('5 snlik ses (Hazır fonk. ile)');
  grid on;

  pause(5);


  subplot(6,4,16); 
  stem(d,'LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('y[n] = x[n] + Ʃ 0.8.k.x[n-400.k] k=3');
  grid on;
  
  m = length(x2);
  
  My_Y2 = MyConv(d, n, x2, m);
  Y2 = conv(d ,x2);
  
  disp('10 saniyelik sesin m=3 için myconv ile konv. yapilmis hali.');
  sound(My_Y2);

  subplot(6,4,17); 
  stem(My_Y2,'LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('10 snlik ses m=3 (MyConv fonk. ile)');
  grid on;

  pause(10);

  disp('10 saniyelik sesin hazır fonksiyonla konv. yapilmis hali.');
  sound(Y2);

  subplot(6,4,18); 
  stem(Y2,'LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('10 snlik ses (Hazır fonk. ile)');
  grid on;

  pause(10);
    %%M=4 için
    d = zeros(1, 1601);
    d(1) = 1;
    d(400)=0.8;
    d(800)=1.6;
    d(1200)=2.4;
    d(1600)=3.2;
   

  subplot(6,4,19); 
  stem(d,'-g','LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('y[n] = x[n] + Ʃ 0.8.k.x[n-400.k] k=4');
  grid on;
  
  m = length(x1);
  n = length(d);
  
  My_Y1 = MyConv(d, n, x1, m);
  Y1 = conv(d ,x1);
  
  disp('5 saniyelik sesin m=4 için myconv ile konv. yapilmis hali.');
  sound(My_Y1);

  subplot(6,4,20); 
  stem(My_Y1, '-g','LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('5 snlik ses m=4 (MyConv fonk. ile)');
  grid on;

  pause(5);

  disp('5 saniyelik sesin hazır fonksiyonla konv. yapilmis hali.');
  sound(Y1);

  subplot(6,4,21); 
  stem(Y1,'-g','LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('5 snlik ses (Hazır fonk. ile)');
  grid on;

  pause(5);

  subplot(6,4,22); 
  stem(d,'LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('y[n] = x[n] + Ʃ 0.8.k.x[n-400.k] k=4');
  grid on;
  
  m = length(x2);
  
  My_Y2 = MyConv(d, n, x2, m);
  Y2 = conv(d ,x2);
  
  disp('10 saniyelik sesin m=4 için myconv ile konv. yapilmis hali.');
  sound(My_Y2);

  subplot(6,4,23); 
  stem(My_Y2,'LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('10 snlik ses m=4 (MyConv fonk. ile)');
  grid on;

  pause(10);

  disp('10 saniyelik sesin hazır fonksiyonla konv. yapilmis hali.');
  sound(Y2);

  subplot(6,4,24); 
  stem(Y2,'LineWidth',1.2);
  ylabel('Amplitude'); 
  xlabel('Time(sec)');
  title('10 snlik ses (Hazır fonk. ile)');
  grid on;

  pause(10);
end

function y = MyConv(x1, n, x2, m)
  y = zeros(1, n+m-1); 
  X1=[x1,zeros(1,m)];
  
  for i=1 : n+m-1
    for j=1 : n
      if(i-j+1>0)
          if(i-j+1>m)
              x2(i-j+1)=0;
          end
          y(i) = y(i) + X1(j)*x2(i-j+1);
      end
    end
  end
end
