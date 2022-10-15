rawdata=load('data5.txt');
freqs=rawdata(:,1);
s11mag=rawdata(:,2);
s21mag=rawdata(:,4);
s12mag=rawdata(:,6);
s22mag=rawdata(:,8);

figure(1)
plot(freqs,[s11mag,s21mag,s12mag,s22mag]');
xlabel('Frequency in GHz')
ylabel('Magnitude of s-parameters')
legend({'|s_{11}|','|s_{21}|','|s_{12}|','|s_{22}|'});
grid on

% extract the phase of the s-parameters (in °) -> vector(200,1)
s11pha=rawdata(:,3);
s21pha=rawdata(:,5);
s12pha=rawdata(:,7);
s22pha=rawdata(:,9);
% plot the phase of the s-parameters
figure(2)
plot(freqs,[s11pha,unwrap(s21pha/180*pi)*180/pi,unwrap(s12pha/180*pi)*180/pi,s22pha]');
xlabel('Frequency in GHz')
ylabel('Phase of s-parameters')
legend({'\angle(s_{11})','\angle(s_{21})','\angle(s_{12})','\angle(s_{22})'});
grid on

% convert the magnitude and phase of the s-parameters to a complex-valued quantity -> vector(200,1)
s11comp=s11mag.*exp(1i*s11pha/180*pi);
s21comp=s11mag.*exp(1i*s21pha/180*pi);
s12comp=s11mag.*exp(1i*s12pha/180*pi);
s22comp=s11mag.*exp(1i*s22pha/180*pi);
% plot the real part of the s-parameters
figure(3)
plot(freqs,real([s11comp,s21comp,s12comp,s22comp])');
xlabel('Frequency in GHz')
ylabel('Real part of s-parameters')
legend({'s_{11}','s_{21}','s_{12}','s_{22}'});
grid on
% plot the imaginary part of the s-parameters
figure(4)
plot(freqs,imag([s11comp,s21comp,s12comp,s22comp])');
xlabel('Frequency in GHz')
ylabel('Imaginary part of s-parameters')
legend({'s_{11}','s_{21}','s_{12}','s_{22}'});
grid on
