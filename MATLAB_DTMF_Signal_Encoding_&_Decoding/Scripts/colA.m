function Hd = colA(fs)
%COLA Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.0 and the Signal Processing Toolbox 7.2.
% Generated on: 15-May-2024 11:01:51

% FIR Window Bandpass filter designed using the FIR1 function.

% All frequency values are in Hz.
Fs = fs;  % Sampling Frequency

Fstop1 = 1150;     % First Stopband Frequency
Fpass1 = 1179;     % First Passband Frequency
Fpass2 = 1240;     % Second Passband Frequency
Fstop2 = 1271;     % Second Stopband Frequency
Dstop1 = 0.1;      % First Stopband Attenuation
Dpass  = 0.1;      % Passband Ripple
Dstop2 = 0.1;      % Second Stopband Attenuation
flag   = 'scale';  % Sampling Flag

% Calculate the order from the parameters using KAISERORD.
[N,Wn,BETA,TYPE] = kaiserord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 ...
                             1 0], [Dstop1 Dpass Dstop2]);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Wn, TYPE, kaiser(N+1, BETA), flag);
Hd = dfilt.dffir(b);

% [EOF]
