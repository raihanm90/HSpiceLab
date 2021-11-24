clc;clf;close all;clear all;

%adding functions to the MATLAB search path
addpath(fullfile(pwd,'..'));

%reading tr_example.tr0 file generated from tr_example.sp file
sim_result=read_hspice_tr_sw_ac('tr_example.tr0');

%name of the signals present in the .tr# file
all_signal_name={sim_result(:).var_name};

%plot of voltage, v(vo), vs. Time
subplot(1,2,1);
x_ind=1;y_ind=3;
plot(sim_result(x_ind).val*1e3,sim_result(y_ind).val,'Linewidth',2);
set(gca,'fontsize',16,'fontweight','bold');grid on;
xlabel([sim_result(x_ind).var_name ' (ms)']);
ylabel([sim_result(y_ind).var_name ' (V)']);

%plot of current, i(vs), vs. Time
subplot(1,2,2);
y_ind=5;
plot(sim_result(x_ind).val*1e3,sim_result(y_ind).val*1e3,'Linewidth',2);
set(gca,'fontsize',16,'fontweight','bold');grid on;
xlabel([sim_result(x_ind).var_name ' (ms)']);
ylabel([sim_result(y_ind).var_name ' (mA)']);

saveas(gcf,'tr_results.png')
