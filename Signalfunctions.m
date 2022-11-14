fs = 100;
t = 0:1/fs:10;
s = sin(2*pi*5*t);
Noisy = randn(size(s))*0.1;
sinw = s+Noisy;
sq = square(s);
squarew = sq + Noisy;
time = seconds(t);

wave = timetable(time',sinw',squarew')
wave = renamevars(wave,["Var1","Var2"],["Sine","Square"])
plot(wave.Time,wave.Sine)
title("Sinewave")
figure
plot(wave.Time,wave.Square)
title("Squarewave")
figure

tstart = seconds(0)
tend = seconds(1)
timelimits = timerange(tstart,tend)
wave = wave(timelimits,:);

plot(wave.Time,wave.Sine)
title("Sinewave with Timelimits")
figure
plot(wave.Time,wave.Square)
title("Squarewave with Timelimits")
figure 

pspectrum(wave,"FrequencyLimits",[0 30])
legend("Sine","Square")
title("Frequency Domain")
figure
pspectrum(wave.Sine,wave.Time,"spectrogram","FrequencyLimits",[2 20],"MinThreshold",-20)
title("Spectrum Analysis of Sine")
figure
pspectrum(wave.Sine,wave.Time,"spectrogram","FrequencyLimits",[2 20],"MinThreshold",-20)
title("Spectrum Analysis of Square")









