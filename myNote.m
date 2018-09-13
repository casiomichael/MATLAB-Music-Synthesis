function [note] = myNote(noteFreq,time)
smallRest = zeros(1,3);
%amplitude and function
Amp = 2.^(-4*time);
I = @(time) 50.^(-time);

%% output
note = [(Amp.*cos((2*pi*noteFreq*time) + ...
    I(time).*cos(2*pi*(noteFreq/2)*time))) smallRest];
end