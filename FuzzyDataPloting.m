clc
clear 
close all

% load('ResultsMobilRobot.mat');

%% Output Controller k1 k2 k3 k4
n=300;
vr =linspace(5,15,n);
wr = linspace(5,15,n);
eta1 = linspace(-4,4,n);
eta2 = linspace(-4,4,n);
k1=zeros(1,n);
k2=zeros(1,n);
k3=zeros(1,n);
k4=zeros(1,n);

for i=1:n
    
    k1(1,i)=evalfis(vr(i),Controllerk1);
    k2(1,i)=evalfis(wr(i),Controllerk2);
    k3(1,i)=evalfis(eta1(i),Controllerk3);
    k4(1,i)=evalfis(eta2(i),Controllerk4);
     
end

figure(1)
plot(vr,k1,'LineWidth',3)
xlabel('v_r','fontsize',16,'FontName','Times New Roman')
ylabel('K_1','fontsize',16,'FontName','Times New Roman')
grid minor
title('OutPut Controller K_1')

figure(2)
plot(wr,k2,'LineWidth',3)
xlabel('w_r','fontsize',16,'FontName','Times New Roman')
ylabel('K_2','fontsize',16,'FontName','Times New Roman')
grid minor
title('OutPut Controller K_2')

figure(3)
plot(eta1,k3,'LineWidth',3)
xlabel('\eta_1','fontsize',16,'FontName','Times New Roman')
ylabel('K_3','fontsize',16,'FontName','Times New Roman')
grid minor
title('OutPut Controller K_3')

figure(4)
plot(eta2,k4,'LineWidth',3)
xlabel('\eta_2','fontsize',16,'FontName','Times New Roman')
ylabel('K_4','fontsize',16,'FontName','Times New Roman')
grid minor
title('OutPut Controller K_4')

%% MembeShip Function for k1 Controller

figure(5)
plotmf(Controllerk1,'input',1)
grid on
xlabel('v_r','fontsize',16,'FontName','Times New Roman')
ylabel('Degree of Membership','fontsize',16,'FontName','Times New Roman')

figure(6)
plotmf(Controllerk1,'output',1)
grid on
xlabel('K_1','fontsize',16,'FontName','Times New Roman')
ylabel('Degree of Membership','fontsize',16,'FontName','Times New Roman')


%% MembeShip Function for k2 Controller

figure(7)
plotmf(Controllerk2,'input',1)
grid on
xlabel('w_r','fontsize',16,'FontName','Times New Roman')
ylabel('Degree of Membership','fontsize',16,'FontName','Times New Roman')

figure(8)
plotmf(Controllerk2,'output',1)
grid on
xlabel('K_2','fontsize',16,'FontName','Times New Roman')
ylabel('Degree of Membership','fontsize',16,'FontName','Times New Roman')


%% MembeShip Function for k3 Controller

figure(9)
plotmf(Controllerk3,'input',1)
grid on
xlabel('\eta_1','fontsize',16,'FontName','Times New Roman')
ylabel('Degree of Membership','fontsize',16,'FontName','Times New Roman')

figure(10)
plotmf(Controllerk3,'output',1)
grid on
xlabel('K_3','fontsize',16,'FontName','Times New Roman')
ylabel('Degree of Membership','fontsize',16,'FontName','Times New Roman')


%% MembeShip Function for k4 Controller

figure(11)
plotmf(Controllerk4,'input',1)
grid on
xlabel('\eta_2','fontsize',16,'FontName','Times New Roman')
ylabel('Degree of Membership','fontsize',16,'FontName','Times New Roman')

figure(12)
plotmf(Controllerk4,'output',1)
grid on
xlabel('K_4','fontsize',16,'FontName','Times New Roman')
ylabel('Degree of Membership','fontsize',16,'FontName','Times New Roman')


%% k1 

figure(13)
plot(t,k1fuzzy)
grid on
xlabel('Time(s)','fontsize',16,'FontName','Times New Roman')
ylabel('K_1(t)','fontsize',16,'FontName','Times New Roman')

%% k2

figure(14)
plot(t,k2fuzzy)
grid on
xlabel('Time(s)','fontsize',16,'FontName','Times New Roman')
ylabel('K_2(t)','fontsize',16,'FontName','Times New Roman')

%% k3

figure(15)
plot(t,k3fuzzy)
grid on
xlabel('Time(s)','fontsize',16,'FontName','Times New Roman')
ylabel('K_3(t)','fontsize',16,'FontName','Times New Roman')


%% k4
figure(14)
plot(t,k4fuzzy)
grid on
xlabel('Time(s)','fontsize',16,'FontName','Times New Roman')
ylabel('K_4(t)','fontsize',16,'FontName','Times New Roman')
