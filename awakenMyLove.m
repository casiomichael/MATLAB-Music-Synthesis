% Michael Casio (mkc40)
% ECE 280-07L
% February 16, 2018
% I have adhered to the Duke Community Standard in completing this assingment.

% sets the sampling frequency to 8000 Hz
fs = 8000;

%% Notes
% anonymous functions for different notes
% each note takes in it's appropriate freq #, which
% is it's positioning in the piano and the duration of the note
a = @(freq,time) myNote(27.5*2^freq,time);
bf = @(freq,time) myNote((27.5*2^freq)*2^(1/12),time);
b = @(freq,time) myNote((27.5*2^freq)*2^(2/12),time);
c = @(freq,time) myNote((27.5*2^freq)*2^(3/12),time);
df = @(freq,time) myNote((27.5*2^freq)*2^(4/12),time);
d = @(freq,time) myNote((27.5*2^freq)*2^(5/12),time);
ef = @(freq,time) myNote((27.5*2^freq)*2^(6/12),time);
e = @(freq,time) myNote((27.5*2^freq)*2^(7/12),time);
f = @(freq,time) myNote((27.5*2^freq)*2^(8/12),time);
gf = @(freq,time) myNote((27.5*2^freq)*2^(9/12),time);
g = @(freq,time) myNote((27.5*2^freq)*2^(10/12),time);
af = @(freq,time) myNote((27.5*2^freq)*2^(11/12),time);
beat = @(time) myBeat(time);
rest = @(time) zeros(1,size(time,2));

%% Time vectors
% vectors for different times; this determines whether a note is an eighth
% note, quarter note, etc.
sixteenth = [0:1/fs:.2-1/fs];
eighth = [0:1/fs:.375-1/fs];
quarter = [0:1/fs:.75-1/fs];
half = [0:1/fs:1.5-1/fs];
threeQ = [0:1/fs:2.25-1/fs];
full = [0:1/fs:3-1/fs];

%% Song Vectors
% vectors for the song's right hand notes, left hand notes, and chords

stayWokeRight = [beat(eighth) rest(quarter) beat(eighth) beat(eighth) rest(eighth) beat(eighth) rest(quarter) beat(eighth) beat(eighth) rest(eighth) beat(eighth) rest(quarter) rest(quarter) rest(zeros(1,3)) ...
    bf(4,eighth) af(3,eighth) gf(3,eighth) f(3,eighth) df(3,eighth) bf(3,eighth) ef(3,full) rest(eighth) rest(zeros(1,6)) df(3,eighth) ef(3,eighth) gf(3,eighth) df(4,eighth) bf(4,quarter) rest(zeros(1,3006)) f(3,eighth) gf(3,eighth) af(3,eighth) gf(3,full) rest(eighth) rest(zeros(1,15018)) ...
    bf(4,eighth) af(3,eighth) gf(3,eighth) f(3,eighth) df(3,eighth) bf(3,eighth) ef(3,full) rest(eighth) rest(zeros(1,6)) df(3,eighth) ef(3,eighth) gf(3,eighth) df(4,eighth) bf(4,quarter) rest(zeros(1,3006)) gf(3,eighth) af(3,eighth) gf(3,eighth) ef(3,full) rest(zeros(1,3003)) rest(eighth) rest(zeros(1,6009)) ...
    af(3,eighth) af(3,eighth) rest(eighth) rest(zeros(1,12015)) gf(3,eighth) bf(4,eighth) b(4,eighth) bf(4,eighth) af(3,eighth) af(3,eighth) gf(3,eighth) gf(3,eighth) rest(eighth) rest(zeros(1,3)) af(3,eighth) af(3,eighth) bf(4,eighth) rest(quarter) rest(zeros(1,6012)) gf(3,eighth) ...
    bf(4,eighth) b(4,eighth) bf(4,eighth) af(3,eighth) af(3,eighth) gf(3,eighth) gf(3,eighth) gf(3,eighth) af(3,eighth) af(3,eighth) bf(4,quarter) rest(zeros(1,6009)) gf(3,eighth) bf(4,eighth) b(4,eighth) bf(4,eighth) af(3,eighth) af(3,quarter) rest(zeros(1,3)) ef(3,eighth) af(3,full)];

stayWokeLeft = .6.*[rest(zeros(1,48021)) b(2,eighth) rest(zeros(1,3003)) gf(1,eighth) b(2,eighth) df(2,eighth) af(1,eighth) df(2,eighth) ef(2,full) bf(1,eighth) rest(zeros(1,3)) ef(2,eighth) df(2,eighth) df(2,eighth) b(2,eighth) b(2,eighth) gf(1,eighth) b(2,eighth) df(2,eighth) af(1,eighth) df(2,eighth) ef(2,full) bf(1,eighth) ef(2,eighth) df(2,eighth) df(2,eighth) b(2,eighth) ...
    b(2,eighth) rest(zeros(1,3003)) gf(1,eighth) b(2,eighth) df(2,eighth) af(1,eighth) df(2,eighth) ef(2,full) bf(1,eighth) rest(zeros(1,3)) ef(2,eighth) df(2,eighth) df(2,eighth) b(2,eighth) b(2,eighth) gf(1,eighth) b(2,eighth) df(2,eighth) af(1,eighth) df(2,eighth) ef(2,eighth) ef(2,full) bf(2,eighth) bf(2,eighth) bf(2,eighth) rest(zeros(1,6006)) ...
    gf(1,eighth) b(2,eighth) df(2,eighth) af(1,eighth) df(2,eighth) ef(2,eighth) ef(2,quarter) rest(zeros(1,3)) ef(2,quarter) rest(zeros(1,3)) ef(2,eighth) df(2,eighth) df(2,eighth) b(2,eighth) b(2,eighth) rest(zeros(1,3)) gf(1,eighth) b(2,eighth) df(2,eighth) af(1,eighth) df(2,eighth) ef(2,eighth) rest(eighth) ...
    ef(2,eighth) rest(zeros(1,3003)) ef(2,eighth) rest(zeros(1,3003)) ef(2,eighth) df(2,eighth) df(2,eighth) b(2,eighth) b(2,eighth) rest(zeros(1,3003)) gf(2,eighth) b(2,eighth) df(2,eighth) af(2,eighth) df(2,eighth) ef(2,eighth) rest(zeros(1,3003)) ef(2,eighth) rest(zeros(1,3003)) ef(2,eighth) df(2,eighth) df(2,eighth) b(2,full)];

stayWokeChords = [rest(zeros(1,279174)) (gf(2,half)+ef(2,half)+c(1,half))./3 rest(zeros(1,9)) (af(2,half)+f(2,half)+df(1,half))./3 rest(zeros(1,9)) (bf(2,half)+gf(2,half)+ef(2,half))./3 rest(zeros(1,12021)) (gf(2,half)+ef(2,half)+c(1,half))./3 rest(zeros(1,2991)) (af(2,half)+f(2,half)+df(1,half))./3 rest(zeros(1,21051)) (gf(2,half)+ef(2,half)+c(1,half))./3 rest(zeros(1,9018)) (bf(2,half)+gf(2,half)+ef(2,half))./3 rest(zeros(1,33021))];

%% Final Vector and Plots
fVec = (stayWokeRight+stayWokeLeft+stayWokeChords)./3; % final song vector
% plots the left, right, and chord hands, as well as a graph of a single B
% flat eighth note
hold on 
figure(1);
plot(stayWokeRight);
plot(stayWokeLeft);
plot(stayWokeChords);
figure(2);
plot(bf(2,eighth));

% plays the left, right, and chord hands of the song
soundsc(stayWokeLeft,fs);
soundsc(stayWokeRight,fs);
soundsc(stayWokeChords,fs);

%% Save to File
% saves the song to a .wav file
filename = 'Casio_Redbone.wav';
audiowrite(filename,fVec,fs);
clear fVec fs