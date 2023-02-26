clc; 
clear;
clearvars;

[tel,fs]= audioread('Ornek.wav');
disp("--- VERİLEN SES ---");
fprintf("Örnekleme frekansı (fs) -> %d kHz\n",fs);
ns = length(tel);
t = (1/fs)*(1:ns);
figure (1);
subplot(4, 4, 2); plot(t, tel); subplot(4, 4, 3);
stem(t, tel);
pause(1);
d = floor(length(tel)/11);
%sound(tel, fs);

L = length(tel);
f = fs*(0:(L/2))/L;

tel1 = tel(1:d);
tel2 = tel(d:2*d);
tel3 = tel(2*d:3*d);
tel4 = tel(3*d:4*d);
tel5 = tel(4*d:5*d);
tel6 = tel(5*d:6*d);
tel7 = tel(6*d:7*d);
tel8 = tel(7*d:8*d);
tel9 = tel(8*d:9*d);
tel10 = tel(9*d:10*d);
tel11 = tel(10*d:11*d);

y1=abs(fft(tel1));
Nsamps = length(y1);
f1 = fs*(0:Nsamps-1)/Nsamps;
y2=abs(fft(tel2));
Nsamps = length(y2);
f2 = fs*(0:Nsamps-1)/Nsamps;
y3=abs(fft(tel3));
Nsamps = length(y3);
f3 = fs*(0:Nsamps-1)/Nsamps;
y4=abs(fft(tel4));
Nsamps = length(y4);
f4 = fs*(0:Nsamps-1)/Nsamps;
y5=abs(fft(tel5));
Nsamps = length(y5);
f5 = fs*(0:Nsamps-1)/Nsamps;
y6=abs(fft(tel6));
Nsamps = length(y6);
f6 = fs*(0:Nsamps-1)/Nsamps;
y7=abs(fft(tel7));
Nsamps = length(y7);
f7 = fs*(0:Nsamps-1)/Nsamps;
y8=abs(fft(tel8));
Nsamps = length(y8);
f8 = fs*(0:Nsamps-1)/Nsamps;
y9=abs(fft(tel9));
Nsamps = length(y9);
f9 = fs*(0:Nsamps-1)/Nsamps;
y10=abs(fft(tel10));
Nsamps = length(y10);
f10 = fs*(0:Nsamps-1)/Nsamps;
y11=abs(fft(tel11));
Nsamps = length(y11);
f11 = fs*(0:Nsamps-1)/Nsamps;

subplot(4, 4, 5); plot(f1, y1);
subplot(4, 4, 6); plot(f2, y2);
subplot(4, 4, 7); plot(f3, y3);
subplot(4, 4, 8); plot(f4, y4);
subplot(4, 4, 9); plot(f5, y5);
subplot(4, 4, 10); plot(f6, y6);
subplot(4, 4, 11); plot(f7, y7);
subplot(4, 4, 12); plot(f8, y8);
subplot(4, 4, 13); plot(f9, y9);
subplot(4, 4, 14); plot(f10, y10);
subplot(4, 4, 15); plot(f11, y11);
d = 0.5;

key = [0 5 3 4 0 7 5 9 8 9 2];
fs = 8000;

f1Values = [941, 697, 697, 697, 770, 770, 770, 852, 852, 852, 941];
f2Values = [1336, 1209, 1336, 1477, 1209, 1336, 1477, 1209, 1336, 1477, 1336];

y = [];

for i = 1:length(key)
   c = key(i); 
   f1 = f1Values(key(i)+1);
   f2 = f2Values(key(i)+1);
   
   t = 0:1/fs:0.5; 
   y_i = (sin(2*pi*f1*t) + sin(2*pi*f2*t)) / 2; 
   y_i = min(max(y_i, -1), 1);
   
   y = [y y_i];
end

audiowrite('numaram.wav', y, fs);

for i=1 : 11
    
    fa = 8000;
    Ta = 1/fa;
    t = 0:Ta:d;
    x = sin(2*pi*f1*t)+sin(2*pi*f2*t);

    %sound(x);  
    Nsamps = length(x);
    f = fa*(0:Nsamps-1)/Nsamps;
    y = abs(fft(x));
    figure (2);
    subplot(4, 3, i); plot(f,y);
    pause(0.7);
end;

[tel,fs] = audioread('Ornek.wav');
disp("Ornek.wav oynatılıyor...");
sound(tel);
pause(2);

u = length(tel);
t = (1/fs)*(1:u);

figure('Name','Ornek.wav plot ve stem','NumberTitle','off');
subplot(2, 1, 1);
plot(t, tel);
title("Ornek.wav plot gösterimi");
ylabel('Amplitude');
xlabel('Time(sec)');
subplot(2, 1, 2);
stem(t, tel);
title("Ornek.wav stem gösterimi");
ylabel('Amplitude');
xlabel('Time(sec)');

d = floor(u/11);

tel1 = tel(1:d);
y = abs(fft(tel1));
nsamp = 11
f = fs*(0:nsamp-1)/nsamp;

figure('Name','Ornek basılanlar plot gösterimi','NumberTitle','off');
u2 = length(f)/2;
subplot(4, 2, 1);
plot(f(1:u2),y(1:u2));
ylabel('Amplitude');
xlabel('Frequency(Hz)');

for i=1 : 10
    teli = tel((d*i):(d*(i+1)));
    y = abs(fft(teli));
    nsamp = length(y);
    f = fs*(0:nsamp-1)/nsamp;
    u2 = floor(length(f)/2);

    subplot(4, 4, (i+1)); 
    plot(f(1:u2), y(1:u2));
    ylabel('Amplitude'); 
    xlabel('Frequency(Hz)');
end

    %%%%% KENDİ NUMARAM %%%%%
[tel ,fs] = audioread('numaram.wav');
disp("Telefon numarası oynatılıyor...");
sound(tel);

u = length(tel);
t = (1/fs)*(1:u);

figure('Name','numaram.wav plot ve stem','NumberTitle','off');
subplot(2, 1, 1);
plot(t, tel);
title("numaram.wav plot gösterimi");
ylabel('Amplitude'); 
xlabel('Time(sec)');
subplot(2,1,2);
stem(t, tel);
title("numara.wav stem gösterimi");
ylabel('Amplitude'); 
xlabel('Time(sec)');

d = floor(u/11);

tel1 = tel(1:d);
y = abs(fft(tel1));
nsamp = length(y);
f = fs*(0:nsamp-1)/nsamp;

figure ('Name','Numaralar Plot Gösterimi','NumberTitle','off');
u2 = length(f)/2;
subplot(4,3,1);
plot(f(1:u2),y(1:u2));
ylabel('Amplitude'); 
xlabel('Frequency(Hz)');

for i=1 : 10
    teli = tel((d*i):(d*(i+1)));
    y = abs(fft(teli));
    nsamp = length(y);
    f = fs * (0:nsamp-1)/nsamp;
    u2 = floor(length(f)/2);

    subplot(4, 3, (i+1)); 
    plot(f(1:u2), y(1:u2));
    ylabel('Amplitude'); 
    xlabel('Frequency(Hz)');
end
