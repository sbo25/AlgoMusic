% initialize matrix:
N = 24;  % number of notes
M = zeros(N,6);

musicarray=[48 50 52 53 55 57 59 60 62 64 65 67 69 71 72 74 76 77 79 81 83];
x = floor(rand*3)+1;

    if x == 1
        old = [8 12 15 17];
    end
    if x == 2
        old = [12 15 18 20];
    end
    if x == 3
        old = [13 16 19 21];
    end

    old1 = getnew(old);
    old2 = getnew(old1);
    old3 = getnew(old2);
   
   
M(:,1) = 1;         % all in track 1
M(:,2) = 10;         % all in channel 1
M(:,3) = [musicarray(old) musicarray(fliplr(old(2:3)))...  
    musicarray(old1) musicarray(fliplr(old1(2:3)))...
    musicarray(old2) musicarray(fliplr(old2(2:3)))...
    musicarray(old3) musicarray(fliplr(old3(2:3)))];    
M(:,4) = 80 ;  % lets have volume stay 80
M(:,5) = (.5:.5:12)';  % note on:  notes start every .5 seconds
M(:,6) = M(:,5) + .5;   % note off: each note has duration .5 seconds

midi_new = matrix2midi(M);
writemidi(midi_new, 'testout.mid')