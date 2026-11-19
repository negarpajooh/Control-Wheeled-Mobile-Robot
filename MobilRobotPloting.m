clc
clear 
close all
%% Defaults for this blog post
width = 8;     % Width in inches
height = 4;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz =16 ;      % Fontsize
lw = 1;      % LineWidth
msz = 8;       % MarkerSize
%%
load('ResultsMobilRobot.mat')
t=tout;
%% Error Analyse
% Mse Error
MseError = [mse(enois(:,1)),mse(enois(:,2)),mse(enois(:,3)),mse(etanois(:,1)),mse(etanois(:,2))
             mse(efuzzy(:,1)),mse(efuzzy(:,2)),mse(efuzzy(:,3)),mse(etafuzzy(:,1)),mse(etafuzzy(:,2))];
% Rmse Error
RmseError = [mse(enois(:,1)),mse(enois(:,2)),mse(enois(:,3)),mse(etanois(:,1)),mse(etanois(:,2))
             mse(efuzzy(:,1)),mse(efuzzy(:,2)),mse(efuzzy(:,3)),mse(etafuzzy(:,1)),mse(etafuzzy(:,2))];
% Maximum Error         
MaxError = [max(abs(enois(:,1))),max(abs(enois(:,2))),max(abs(enois(:,3))),max(abs(etanois(:,1))),max(abs(etanois(:,2)))
            max(abs(efuzzy(:,1))),max(abs(efuzzy(:,2))),max(abs(efuzzy(:,3))),max(abs(etafuzzy(:,1))),max(abs(etafuzzy(:,2)))];
 %% Results no Noising 
figure (1)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(2,2,1)
plot (zr(:,1),zr(:,2),'r')
axis equal
title('Actual Model')
xlabel('Z1r')
ylabel('Z2r')
grid minor
subplot(2,2,2)
plot (z(:,1),z(:,2))
title('Trajectory Model')
axis equal
xlabel('Z1')
ylabel('Z2')
grid minor
subplot(2,2,[3 4])
plot (z(:,1),z(:,2),'LineWidth',2)
hold on
plot (zr(:,1),zr(:,2),'r')
axis equal
legend('Actual Model','Refrence Model')
xlabel('X transformed')
ylabel('Y transformed')
grid minor
exportgraphics(gcf, 'my_figure.png', 'Resolution', 600);
%%
figure(2)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot (t,dhat)
title('Estimat of d')
xlabel('time- sec')
ylabel('d hat')
grid minor
exportgraphics(gcf, 'my_figure1.png', 'Resolution', 600);
%% figure(3)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(2,1,1)
plot (t,controleffort(:,1),'r');
hold on
plot (t,V(:,1));
legend('\omega_c','\omega')
title('Control Effort')
xlabel('time- sec')
ylabel('Angular Velocity - rad/sec')
grid minor
subplot(2,1,2)
plot (t,controleffort(:,2),'r');
hold on
plot (t,V(:,2));
legend('v_c','v')
xlabel('time- sec')
ylabel('Straight Line Velocity - m/sec')
grid minor
exportgraphics(gcf, 'my_figure2.png', 'Resolution', 600);
%%
figure(4)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,e(:,1))
legend('e_1')
title('Trajectory Error');
xlabel('time- sec')
ylabel('e_1')
grid minor
subplot(3,1,2)
plot(t,e(:,2))
legend('e_2')
xlabel('time- sec')
ylabel('e_2')
grid minor
subplot(3,1,3)
plot(t,e(:,3))
legend('e_3')
xlabel('time- sec')
ylabel('e_3')
grid minor
exportgraphics(gcf, 'my_figure3.png', 'Resolution', 600);
%%
figure(5)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,tav(:,1),'r')
legend('\tau_{1}')
title('Torque');
xlabel('time- sec')
ylabel('\tau_{1}- N.m')
grid minor
subplot(3,1,2)
plot(t,tav(:,2))
legend('\tau_{2}');
xlabel('time- sec')
ylabel('\tau_{2}- N.m')
grid minor
subplot(3,1,3)
plot(t,tav(:,1),'r')
hold on
plot(t,tav(:,2))
legend('\tau_{1}','\tau_{2}')
xlabel('time- sec')
ylabel('\tau')
grid minor
exportgraphics(gcf, 'my_figure4.png', 'Resolution', 600);
%%
figure(6)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,eta(:,1),'r')
title('\eta Error');
xlabel('time- sec')
ylabel('\eta_{1}- m/sec')
grid minor
subplot(3,1,2)
plot(t,eta(:,2))
xlabel('time- sec')
ylabel('\eta_{2} - rad/sec')
grid minor
subplot(3,1,3)
plot(t,eta(:,1),'r')
hold on
plot(t,eta(:,2))
legend('\eta_{1}','\eta_{2}')
xlabel('time- sec')
ylabel('\eta')
grid minor
exportgraphics(gcf, 'my_figure5.png', 'Resolution', 600);
%%
figure(7)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,Phi(:,1),'r')
title('Estimate of \phi');
xlabel('time- sec')
ylabel('\phi_{1}')
grid minor
subplot(3,1,2)
plot(t,Phi(:,2))
xlabel('time- sec')
ylabel('\phi_{2}')
grid minor
subplot(3,1,3)
plot(t,Phi(:,3)) 
xlabel('time- sec')
ylabel('\phi_{3}')
grid minor
exportgraphics(gcf, 'my_figure6.png', 'Resolution', 600);
%% Results With Noising
figure (8)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(2,2,1)
plot (zrnois(:,1),zrnois(:,2),'r')
axis equal
title('Trajectory Model with Noising Signal')
xlabel('Z1')
ylabel('Z2')
grid minor
subplot(2,2,2)
plot (znois(:,1),znois(:,2))
axis equal
title('Actual Model')
xlabel('Z1r')
ylabel('Z2r')
grid minor
subplot(2,2,[3 4])
plot (znois(:,1),znois(:,2),'LineWidth',2)
hold on
plot (zrnois(:,1),zrnois(:,2),'r')
axis equal
legend('Actual Model','Refrence Model');
xlabel('X transformed')
ylabel('Y transformed')
grid minor
exportgraphics(gcf, 'my_figure7.png', 'Resolution', 600);
%%
figure(9)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot (t,dhatnois)
title('Estimat of d with Noising Signal')
xlabel('time- sec')
ylabel('dhat  nois')
grid minor
exportgraphics(gcf, 'my_figure8.png', 'Resolution', 600);
%%
figure(10)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(2,1,1)
plot (t,controleffortnois(:,1),'r--');
hold on
plot (t,Vnois(:,1));
legend('\omega_c','\omega')
% title('Control Effort with Noising Signal');
title('Angular Velocity');
xlabel('time- sec')
ylabel('amplitude- rad/sec')
grid minor
subplot(2,1,2)
plot (t,controleffortnois(:,2),'r--');
hold on
plot (t,Vnois(:,2));
legend('v_c','v')
xlabel('time- sec')
ylabel('amplitude- m/sec')
title('Straight Line Velocity')
grid minor
exportgraphics(gcf, 'my_figure9.png', 'Resolution', 600);
%%
figure(11)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,enois(:,1))
title('Trajectory Error with Noising Signal');
xlabel('time- sec')
ylabel('e_1')
grid minor
subplot(3,1,2)
plot(t,enois(:,2))
xlabel('time- sec')
ylabel('e_2')
grid minor
subplot(3,1,3)
plot(t,enois(:,3))
xlabel('time- sec')
ylabel('e_3')
grid minor
exportgraphics(gcf, 'my_figure10.png', 'Resolution', 600);
%%
figure(12)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,tavnois(:,1),'r')
title('Torque with Noising Signal');
xlabel('time- sec')
ylabel('\tau_{1}')
grid minor
subplot(3,1,2)
plot(t,tavnois(:,2))
xlabel('time- sec')
ylabel('\tau_{2}')
grid minor
subplot(3,1,3)
plot(t,tavnois(:,1),'r')
hold on
plot(t,tavnois(:,2))
legend('\tau_{1}','\tau_{2}')
xlabel('time- sec')
ylabel('\tau')
grid minor
exportgraphics(gcf, 'my_figure11.png', 'Resolution', 600);
%%
figure(13)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,etanois(:,1),'r')
title('\eta Error with Noising Signal');
xlabel('time- sec')
ylabel('\eta_{1}- m/sec')
grid minor
subplot(3,1,2)
plot(t,etanois(:,2))
xlabel('time- sec')
ylabel('\eta_{2}- rad/sec')
grid minor
subplot(3,1,3)
plot(t,etanois(:,1),'r')
hold on
plot(t,etanois(:,2))
legend('\eta_{1}','\eta_{2}')
xlabel('time- sec')
ylabel('\eta')
grid minor
exportgraphics(gcf, 'my_figure12.png', 'Resolution', 600);
%%
figure(14)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,Phinois(:,1))
title('Estimate of \phi with Noising Signal');
xlabel('time- sec')
ylabel('\phi_{1}')
grid minor
subplot(3,1,2)
plot(t,Phinois(:,2))
xlabel('time- sec')
ylabel('\phi_{2}')
grid minor
subplot(3,1,3)
plot(t,Phinois(:,3))
xlabel('time- sec')
ylabel('\phi_{3}')
grid minor
exportgraphics(gcf, 'my_figure13.png', 'Resolution', 600);
%% Results With Noising Fuzzy System
figure (15)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(2,2,1)
plot (zrfuzzy(:,1),zrfuzzy(:,2),'r')
axis equal
title('Trajectory Model Fuzzy System with Noising Signal');
xlabel('Z1')
ylabel('Z2')
grid minor
subplot(2,2,2)
plot (zfuzzy(:,1),zfuzzy(:,2))
axis equal
title('Actual Model')
xlabel('Z1r')
ylabel('Z2r')
grid minor
subplot(2,2,[3 4])
plot (zfuzzy(:,1),zfuzzy(:,2),'LineWidth',2)
hold on
plot (zrfuzzy(:,1),zrfuzzy(:,2),'r')
axis equal
legend('Actual Model','Refrence Model')
xlabel('X transformed')
ylabel('Y transformed')
grid minor
exportgraphics(gcf, 'my_figure14.png', 'Resolution', 600);
%%
figure(16)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot (t,dhatfuzzy)
title('Estimat of d Fuzzy System with Noising Signal');
xlabel('time- sec')
ylabel('dhat  fuzzy')
grid minor
exportgraphics(gcf, 'my_figure15.png', 'Resolution', 600);
%%
figure(17)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(2,1,1)
plot (t,controleffortfuzzy(:,1),'r');
hold on
plot (t,Vfuzzy(:,1));
legend('\omega_c','\omega')
title('Control Effort Fuzzy System with Noising Signal');
xlabel('time- sec')
ylabel('amplitude- rad/sec')
title('Angular Velocity')
grid minor 
subplot(2,1,2)
plot (t,controleffortfuzzy(:,2),'r');
hold on
plot (t,Vfuzzy(:,2));
legend('v_c','v')
xlabel('time- sec')
ylabel('amplitude- m/sec')
title('Straight Line Velocity')
grid minor
exportgraphics(gcf, 'my_figure16.png', 'Resolution', 600);
%%
figure(18)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,efuzzy(:,1))
title('Trajectory Error Fuzzy System with Noising Signal');
xlabel('time- sec')
ylabel('e_1')
grid minor
subplot(3,1,2)
plot(t,efuzzy(:,2))
xlabel('time- sec')
ylabel('e_2')
grid minor
subplot(3,1,3)
plot(t,efuzzy(:,3))
xlabel('time- sec')
ylabel('e_3')
grid minor
exportgraphics(gcf, 'my_figure17.png', 'Resolution', 600);
%%
figure(19)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,tavfuzzy(:,1))
title('Torque Fuzzy System with Noising Signal');
xlabel('time- sec')
ylabel('\tau_{1}- N.m')
grid minor
subplot(3,1,2)
plot(t,tavfuzzy(:,2))
xlabel('time- sec')
ylabel('\tau_{2}- N.m')
grid minor
subplot(3,1,3)
plot(t,tavfuzzy(:,1))
hold on
plot(t,tavfuzzy(:,2))
legend('\tau_{1}','\tau_{2}')
xlabel('time- sec')
ylabel('\tau- N.m')
grid minor
exportgraphics(gcf, 'my_figure18.png', 'Resolution', 600);
%%
figure(20)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,etafuzzy(:,1),'r')
title('\eta Error Fuzzy System with Noising Signal');
xlabel('time- sec')
ylabel('\eta_{1}')
grid minor
subplot(3,1,2)
plot(t,etafuzzy(:,2))
xlabel('time- sec')
ylabel('\eta_{2}')
grid minor
subplot(3,1,3)
plot(t,etafuzzy(:,1),'r')
hold on
plot(t,etafuzzy(:,2))
legend('\eta_{1}','\eta_{2}')
xlabel('time- sec')
ylabel('\eta')
grid minor
exportgraphics(gcf, 'my_figure19.png', 'Resolution', 600);
%% figure(21)
figure(21)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,Phifuzzy(:,1))
title('Estimate of \phi Fuzzy System with Noising Signal');
xlabel('time- sec')
ylabel('\phi_{1}')
grid minor
subplot(3,1,2)
plot(t,Phifuzzy(:,2))
xlabel('time- sec')
ylabel('\phi_{2}')
grid minor
subplot(3,1,3)
plot(t,Phifuzzy(:,3))
xlabel('time- sec')
ylabel('\phi_{3}')
grid minor
exportgraphics(gcf, 'my_figure20.png', 'Resolution', 600);
%% Nois Signal 
figure(22)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(noisSignal)
xlabel('time - sec')
ylabel('Signal')
title('Nois Signal');
grid minor
xlim([0,100])
exportgraphics(gcf, 'my_figure21.png', 'Resolution', 600);
%%


