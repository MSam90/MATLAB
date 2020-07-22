% *********************************************** %
%               Mohamed Abou Samak                %
%            Implementing Digital Filter          %
% *********************************************** %


% *********************************************** %
%   Signal extraction and time domain plot        %
% *********************************************** %

clc
clear

[x,Fs] = audioread('sineWave800Hz+whiteNoise_Fs20kHz_Oct2016.wav');
Ts = 1/Fs;
t = 0:Ts:(length(x)*Ts)-Ts;
h = [0.5 0.5 0.5 0.5 0.5 0.3 0.2 0.1];
yx = fftfilt(h,x);
y = zeros(1,40000);

for n = 1: length(x)
    
    if n <= 1
        
        y(n) = h(n) * x(n);
        
        z = (n+1);
        
    elseif n > 1 && n <= 8
        
        for m = 2:8
            
            y(m) = y(m-1) + h(m) * x(m);
        
        end
        
    else
        y(n) = h(1) * x(n) + h(2) * x(n-1)+ h(3) * x(n-2)+ h(4) * x(n-3)+ h(5) * x(n-4)+ h(6) * x(n-5)+h(7) * x(n-6) + h(8) * x(n-7);
    end
        
    
    

end

y_out = y/max(abs(y));
audiowrite('filter2.wav',y_out,Fs);

% **************************************** %
%    Original and filtered signal plot     %
% **************************************** %

figure(1)
subplot(2,2,1)
plot(t,x,'b');
hold on
plot(t,y,'r'); xlabel('Time (ms)'); ylabel('Amplitude');
title('Original signal vs Filtered Signal')
legend ('Original','Filtered')
xlim([0 0.005]);
ylim([-2 2]);

% **************************************** %
%    Frequency response of filter 2        %
% **************************************** %

h = [h,zeros(1,248)];
Y = fft(h,256);
Y = abs(Y(1:128));
subplot(2,2,2)
p1 = plot(20*log10(Y));
title('Frequency Response')
xlabel('Normalized frequency')
ylabel('Magnitude (dB)')
xlim([0 128])
ylim([-20 10])




f_in = fft(x,Fs);
f_out = fft(y,Fs);

f_in = f_in(1:Fs/2);
f_out = f_out(1:Fs/2);

f_in = 20*log10(abs(f_in));
f_out = 20*log10(abs(f_out));


subplot(2,2,[3 4])
plot(f_in,'b')
xlim([0.75E3 0.85E3])
ylim([-20 90])
hold on
subplot(2,2,[3 4])
plot(f_out,'r')
title ('Amplitude response')
xlabel('Frequency')
ylabel('Magnitude (dB)')
legend ('Original','Filtered')
xlim([0.75E3 0.85E3])
ylim([-20 90])

m_in = max(f_in);
mout = max(f_out);
mout - m_in;

