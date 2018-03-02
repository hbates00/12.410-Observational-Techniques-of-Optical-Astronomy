for i = 1:length(slice1)
    
   starSignal(i) = SourceSky(i) +  SkyPixel(i)*Source_Radius(i)
   imageNumber(i) = slice1(i) + 100
   
   magnitude(i) = -2.5*log10(starSignal(i))+22
end

clf
hold on
title('Signal of Pulsar v. Image Number')
xlabel('Image Number')
ylabel('Signal (Number of Counts)')
xlim([90,210]);
plot(imageNumber,starSignal,'r.')

print('PulsarSignal','-deps')

clf
hold on
title('Magnitude of Pulsar v. Image Number')
xlabel('Image Number')
ylabel('Magnitude')
xlim([90,210]);
plot(imageNumber,magnitude,'r.')
set(gca, 'Ydir', 'reverse')


print('PulsarMag','-deps')