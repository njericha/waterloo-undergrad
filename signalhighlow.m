% This code reads data from an audiofile and applies a highpass filter and
% low pass filter to extract those parts of the audio. This is currently
% applied to a file that has both a train whistle and birds chirping to
% extract those two components. The resuling files are plotted in both time
% and fourier space.

% define some strings
time = 'Time (s)';
amplitude = 'Amplitude (%)';
power = 'Intensity |F|';
frequency = 'Frequency (Hz)';

% read the audio file samples
audiofile = 'train_bird.wav';
[f, Fs] = audioread(audiofile);

% sampling and time definitions
N = length(f);
T = 1/Fs; %period of one sample
tmax = N*T;
ts = 0:T:tmax-T;

%plot original audio
figure(1)
plot(ts,f)
title('Original Sound Clip')
xlabel(time)
ylabel(amplitude)

% apply fourier transform and plot power spectrum
F = fftshift(fft(f));
fmin = floor(-N/2);
fmax = floor(N/2)-1;
fdomain = fmin:fmax;

figure(2)
plot(fdomain,abs(F))
title('Original Sound Power Spectrum')
xlabel(frequency)
ylabel(power)


% Copy power spectrum before filtering
Ftrain = F;
Fbird = F;

cutof = 2000; %cutoff frequency for filters

% apply highpass filter to zero lower frequencies
highpass = (fmax - cutof) : (fmax + cutof);
for n = highpass
  Fbird(n) = 0;
end

% apply lowpass filter to zero higher frequencies
lowpass = [1:(fmax - cutof), (fmax + cutof):N];
for n = lowpass
  Ftrain(n) = 0;
end

% inverse fourier transform to go back to time domain
train = real(ifft(ifftshift(Ftrain)));
bird = real(ifft(ifftshift(Fbird)));

% Plot the extracted train and bird sounds in time and fourier space
figure(3)
plot(ts,train)
title('Extracted Train Sound')
xlabel(time)
ylabel(amplitude)

figure(4)
plot(ts,bird)
title('Extracted Bird Sound')
xlabel(time)
ylabel(amplitude)

figure(5)
plot(fdomain,abs(Ftrain))
title('Train Sound Power Spectrum')
xlabel(frequency)
ylabel(power)

figure(6)
plot(fdomain,abs(Fbird))
title('Bird Sound Power Spectrum')
xlabel(frequency)
ylabel(power)