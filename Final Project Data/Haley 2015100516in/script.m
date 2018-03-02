%% 12.410 Final Project

% Import all data with the import button. 

x = JD2400000; 

hold on

set(gca,'Fontsize',14)
plot(x,rel_flux_T1,'b.');
%plot(x,rel_flux_C2,'y.');
%plot(x,rel_flux_C3,'r.');
%plot(x,rel_flux_C4 + 0.75,'g.');
%plot(x,rel_flux_C5,'c*');
%plot(x,rel_flux_C6,'k*');
%plot(x,rel_flux_C7,'m*');
%title('Comparison Star Quality Test')
title('Tres-1 b Transiting Exoplanet 20151005')
xlabel('Time (days) since JD2400000')
ylabel('Relative Flux')
%legend('Comparison 1', 'Comparison 2', 'Comparison 3 + .075')
legend('Tres-1 b', 'Comparison 1', 'Comparison 2', 'Comparison 3')


%% New method 


% Import vars

% List mag
MC2 = 13.7;
MC3 = 13.3;
MC4 = 14.2;
MC5 = 13.5;
MC6 = 13.2;
MC7 = 13.8;

% Find relflux (if relflux is >1, get rid of that point for now)

for i = 1:length(rel_flux_T1)
    T1(i) = 100*rel_flux_T1(i);
    C2(i) = 100*rel_flux_C2(i)/(1+rel_flux_C2(i));
    C3(i) = 100*rel_flux_C3(i)/(1+rel_flux_C3(i));
    C4(i) = 100*rel_flux_C4(i)/(1+rel_flux_C4(i));
    C5(i) = 100*rel_flux_C5(i)/(1+rel_flux_C5(i));
    C6(i) = 100*rel_flux_C6(i)/(1+rel_flux_C6(i));
    C7(i) = 100*rel_flux_C7(i)/(1+rel_flux_C7(i));
end

for i = 1:length(rel_flux_T1)
    m2t(i) = -2.5*log10(T1(i)/C2(i)) + MC2;
    m3t(i) = -2.5*log10(T1(i)/C3(i)) + MC3;
    m4t(i) = -2.5*log10(T1(i)/C4(i)) + MC4;
    m5t(i) = -2.5*log10(T1(i)/C5(i)) + MC5;
    m6t(i) = -2.5*log10(T1(i)/C6(i)) + MC6;
    m7t(i) = -2.5*log10(T1(i)/C7(i)) + MC7;
    MT(i) = 1/6*(m2t(i)+m3t(i)+m4t(i)+m5t(i)+m6t(i)+m7t(i));
end



%%
close all
hold on

plot(x,m2t,'b.')
plot(x,m3t,'r.')
plot(x,m4t,'g.')
plot(x,m5t,'c.')
plot(x,m6t,'k.')
plot(x,m7t,'m.')
plot(x,MT)


%%

close all
hold on
set(gca,'Fontsize',14)
plot(x,MT,'b*')
title('Magnitude of Pluto')
xlabel('Time (days) since JD2400000')
ylabel('R Magnitude')
set(gca, 'Ydir', 'reverse')





