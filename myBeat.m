function beat = myBeat(time)
smallRest = zeros(1,3);
Amp = 2.^(-10000*time);
I = @(time) 50.^(-time);
beat = [(Amp.*cos((2*pi*80000*time) + I(time).*cos(2*pi*(40000)*time))) ...
    smallRest];
end