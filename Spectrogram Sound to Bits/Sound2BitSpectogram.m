% *********************************************** %
%               Mohamed Abou Samak                %
%           Sound to bits in spectogram           %
% *********************************************** %

clc

filename = input('Please enter the filename: ','s');
filename = strcat(filename ,'.wav');
b = input('Please enter the frameshift in milliseconds: ');
fs = input('Please enter the framelength time in milliseconds: ');
w = input('Please enter the window type: ','s');
out = mySpecto(filename,b,fs,w);

function  output = mySpecto(file,noverlap,framelength_time,win_type)

[x,Fs] = audioread(file);                                  % Input signal and sampling freq 
Ts = 1/Fs;                                              % Sampling period
t = (length(x)*Ts)*1000;
framelength = (framelength_time/1000) * Fs;             % Framelength
func_window = str2func(win_type);
window = func_window(framelength);
NFFT = 2^nextpow2(framelength);                         % NFFT points for SFTF
tx = (1:length(x))*Ts;                                  % timevector
nframes = round((length(x)-noverlap)/(length(window)-noverlap));
tp = 0:Ts:(length(x)*Ts)-Ts;

% *********************************************** %

f = ((1:NFFT/2)/Fs/NFFT)*1E6;                            %frequency resoultion
y = buffer(x,framelength,noverlap);
y=y.*window;
y=fft(y,NFFT);
y=y([NFFT/2:end],[1:nframes]);
y=20*log10(abs(y));
y = transpose(y);
y = y.';
y = flipud(y);
figure(1)
subplot(2,1,1)
plot(tp,x)
title('Time domain')
ylabel('Amplitude')
xlabel('Time')
subplot(2,1,2)
imagesc(tx,f,y);
title('Spectrogram')
ylabel ('Frequency (KHz)')
xlabel ('Time (ms)')
set(gca,'YDir','normal')
colorbar
output = {tx,f,y};

end
