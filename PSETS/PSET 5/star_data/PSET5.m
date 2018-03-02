%% Opening Images

star2 = fitsread('star2.fits');
%star2 = fitsread('star2.fits');
arc = fitsread('arc.fits');

%% Plotting Spectra

x = 1:1:308;
y = 1:1:3000;

figure(1)

hold on
plot(x,star2(:,1000))
    
%aperatures
plot(188,y,'r.')
plot(208,y,'r.')

%background
plot(178,y,'g.')
plot(170,y,'g.')
plot(218,y,'g.')
plot(226,y,'g.')
title('Target Aperature and Background Aperature of Star 1')
xlabel('Pixel Number')
ylabel('Counts')

%% Adding Columns

star1app = zeros(1,4064);

%adding everything in aperature
for i = 1:1:4064
    for j = 188:1:208
    star1app(i)=star2(j,i)+star1app(i);
    end
end

star1back1 = zeros(1,4064);

%adding everything in background
for i = 1:1:4064
    for j = 170:1:178
    star1back1(i)=star2(j,i)+star1back1(i);
    end
end

star1back2 = zeros(1,4064);

for i = 1:1:4064
    for j = 218:1:226
    star1back2(i)=star2(j,i)+star1back2(i);
    end
end

%% Subtracting the Background

star1total = zeros(1,4064);

for i = 1:1:4064
    star1total(i) = star1app(i) - star1back1(i) - star1back2(i);
end

plot(star1total)
title('Background Subtracted Spectra of Star 1')
xlabel('Pixel Number')
ylabel('Counts')
%% Summing Neon

arctotal = sum(arc);

%% Neon Wavelength Correlation

arcpixel = [1994, 3316, 3024, 2900, 2129];
arcwavelength = [6402.206, 9122.966, 8521.441, 8264.521, 6678.2];

plot(arcpixel,arcwavelength, '*')
title('Pixel to Wavelength Conversion')
xlabel('Pixel Number')
ylabel('Wavelength')

%% Wavelength and X Value Conversion

pixels = 1:1:4064;

for i = 1:1:4064
    wavelength(i) = 2.1*pixels(i)+2.3*10^3;
end

plot(wavelength,star1app)
title('Spectra of Star 1 as a Function of Wavelength')
xlabel('Wavelength')
ylabel('Counts')













