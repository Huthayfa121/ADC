Fs=25;
n=2;
A=10;
f=1;
t=0:1/Fs:2;
m=A*sin(2*pi*t*f);

L=2^n;
% signal
subplot(4,1,1);
plot(m,'b')
title('Analog Signal')
xlabel ('Time [sec]')
ylabel ('Magnitude [volts]')
xlim([0 52]);
ylim([-11 11]);
grid on

%Sampled Signal
subplot(4,1,2);
stem(m,'r')
title('Sampled Signal')
xlabel ('Time [sec]')
ylabel ('Magnitude [volts]')
xlim([0 52]);
ylim([-11 11]);
grid on
stepSize=2*A/L;
partition=-A:stepSize:A;
codebook =-(A+(stepSize/2)):stepSize:(A+(stepSize/2));
[index,quants]=quantiz(m,partition,codebook);
index;

%Quantized Signal
subplot(4,1,3);
stairs(quants);
title('Quantized Signal')
xlabel ('Time [sec]')
ylabel ('Magnitude [volts]')
xlim([0 52]);
ylim([-11 11]);
grid on
l1=length(index);

for i=1:l1
    ind(i)=index(i)-1;
    i=i+1;
end
ind;

code = de2bi(ind ,'left-msb') ;
code;
k=1;
for i=1:l1
    for j=1:n
        code1(k)=code(i,j);
        j=j+1;
        k=k+1;
    end
   i=i+1;
end
code1;
%Transmitted Signal

subplot(4,1,4);
grid on;
stairs(code1);
axis([0 52 -1 1.5]);
title('Digital Signal');
xlabel ('Time [sec]')
ylabel 'Magnitude [volts]'
xlim([0 52]); 
grid on