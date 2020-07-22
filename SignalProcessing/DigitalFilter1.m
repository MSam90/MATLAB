% *********************************************** %
%               Mohamed Abou Samak                %
%                                                 %
% *********************************************** %

clcw
clear

% ************************************************ %
%   Signal extraction and time domain plot         %
% ************************************************ %

[f,Fs] = audioread('sineWave800Hz+whiteNoise_Fs20kHz_Oct2016.wav');
Ts = 1/Fs;
b = [1 -1];
t = 0:Ts:(length(f)*Ts)-Ts;

for n = 1: length(f)
    if n == 1
        y(n) =  b(1) *f(n);
    else
        y(n) =  b(1) *f(n) + b(2) * f(n - 1);
    end
end

y_out = y/max(abs(y));
audiowrite('filter1.wav',y_out,Fs);


% **************************************** %
%    Original and filtered signal plot     %
% **************************************** %

figure(1)
subplot(2,2,1)
plot(t,f,'black'); xlabel('Time'); ylabel('Amplitude');
hold on
plot(t,y,'r'); xlabel('Time'); ylabel('Amplitude');
title('Filter 1 Original signal vs filtered')
legend ('Original','Filtered')
xlim([0 0.0025]);
ylim([-1 1]);


% **************************************** %
%    Frequency response of filter 1        %
% **************************************** %

b = [b,zeros(1,254)];
Y = fft(b);
Y = abs(Y(1:128));
subplot(2,2,2)
plot(20*log10(Y))
title('Filter 2 Frequency Response')
xlabel('Normalized frequency')
ylabel('Magnitude (dB)')
xlim([0 128])
ylim([-20 10])

% ****************************************** %
%                                            %
% ****************************************** %

f_in = fft(f,Fs);
f_out = fft(y,Fs);

f_in = f_in(1:Fs/2);
f_out = f_out(1:Fs/2);

f_in = 20*log10(abs(f_in));
f_out = 20*log10(abs(f_out));

subplot(2,2,[3 4])
plot(f_in,'b')
subplot(2,2,[3 4])
hold on
plot(f_out,'r')
title ('Amplitude response')
xlabel('Frequency')
ylabel('Magnitude (dB)')
legend ('Original','Filtered')
xlim([0.75E3 0.85E3])
ylim([-20 90])

min = max(f_in)
mout = max(f_out)
mout - min
