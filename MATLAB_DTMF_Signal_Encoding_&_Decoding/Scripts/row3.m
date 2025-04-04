function Hd = row3(fs)
%ROW3 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.0 and the Signal Processing Toolbox 7.2.
% Generated on: 15-May-2024 10:58:01

% FIR Window Bandpass filter designed using the FIR1 function.

% All frequency values are in Hz.
Fs = fs;  % Sampling Frequency

Fstop1 = 810;      % First Stopband Frequency
Fpass1 = 831;      % First Passband Frequency
Fpass2 = 873;      % Second Passband Frequency
Fstop2 = 895;      % Second Stopband Frequency
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
