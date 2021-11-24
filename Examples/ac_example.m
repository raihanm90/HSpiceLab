clc;clf;close all;clear all;

%adding functions to the MATLAB search path
addpath(fullfile(pwd,'..'));

%reading tr_example.tr0 file generated from tr_example.sp file
sim_result=read_hspice_tr_sw_ac('ac_example.ac0');

%name of the signals present in the .tr# file
all_signal_name={sim_result(:).var_name};

%Bode plot of the output vo of the high pass filter
%Magnitude in dB
%calculating dB value from real and imaginary values
vdB_manual=20*log10(sqrt(sim_result(4).val.^2+sim_result(5).val.^2));
%extracting dB value directly from HSpice output
vdB_direct=sim_result(16).val;

subplot(2,1,1)
x_ind=1;y_ind=16;
semilogx(sim_result(x_ind).val,sim_result(y_ind).val,'Linewidth',2);
set(gca,'fontsize',16,'fontweight','bold');grid on;
xlabel(['Frequency (' sim_result(x_ind).var_name ')']);xlim([100 1e9]);
ylabel({'Magnitude, ', [sim_result(y_ind).var_name ' (dB)']});ylim([-80 20])

%phase in degrees
subplot(2,1,2)
x_ind=1;y_ind=15;
semilogx(sim_result(x_ind).val,sim_result(y_ind).val,'Linewidth',2);
set(gca,'fontsize',16,'fontweight','bold');grid on;
xlabel(['Frequency (' sim_result(x_ind).var_name ')']);xlim([100 1e9]);
ylabel({'Phase, ',[sim_result(y_ind).var_name ' (degrees)']});

%saving figures
ff=gcf;
% <R2019b
% ff.PaperUnits = 'inches';
% ff.PaperPosition = [0 0 8 5];
% print('ac_results','-dpng','-r0')
% >R2019b
ff.Units = 'inches';
ff.OuterPosition = [0.25 0.25 8 5];
exportgraphics(ff,'ac_results.png')
