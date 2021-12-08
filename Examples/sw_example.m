clc;clf;close all;clear all;

%adding functions to the MATLAB search path
addpath(fullfile(pwd,'..'));

%reading sw_example.sw0 file generated from sw_example.sp file
sim_result=read_hspice_tr_sw_ac('sw_example.sw0');

%name of the signals present in the .sw# file
all_signal_name={sim_result(:).var_name};

%plot of diode IV, abs(i(vs)) vs. v(vd)
x_ind=3;y_ind=5;
plot(sim_result(x_ind).val,abs(sim_result(y_ind).val)*1e3,'Linewidth',2);
set(gca,'fontsize',16,'fontweight','bold');grid on;
xlabel([sim_result(x_ind).var_name ' (V)']);
ylabel([sim_result(y_ind).var_name ' (mA)']);

%saving figures
saveas(gcf,'sw_results.png')
