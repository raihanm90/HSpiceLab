%Read HSPICE generated ASCII formatted .tr0 files 
%% Author
%Mohammad Abu Raihan Miah
%University of California, San Diego
%ver 2.0, 10/24/21
%% Code description
%This Code reads the HSPICE output file 'filename.tr0' and saves the
%data in 'filename_results.mat format'.
%data are save in two formats.
%simulation_result: data saved in structure format with the name of plotted
%                   data
%sim_result: simulation results are saved in column format
%
%% Example for calling this function:
% read_hspice_tr0('rcsim.tr0')
% 
% Data will be saved in 'rcsim_results.mat' file
%
%% main function
%Don't touch here
function read_hspice_tr0(filename_tr0)

% read data from the file
filetr0 = fopen(filename_tr0);
content_filetr0 = textscan(filetr0,'%s','HeaderLines',3);
fclose(filetr0);

% find number and name of the variables and start point of the data
content_str=string(content_filetr0{1,1});clear content_filetr0
num_var=find(content_str==string('TIME'))-1;
data_start_ind=find(content_str==string('$&%#'))+1;
flag=num_var;jj=data_start_ind-2;simulation_result(1).var_name='Time';
while jj>num_var+1
    if isempty(find(char(content_str(jj))=='('))~=1
        simulation_result(flag).var_name=[char(content_str(jj)) ')'];
        jj=jj-1;
    else
        simulation_result(flag).var_name=[char(content_str(jj-1)) char(content_str(jj)) ')'];
        jj=jj-2;
    end
    flag=flag-1;
end

% create a structure in double from the data
data=replace(strjoin(content_str(data_start_ind:end)),' ','');
data_separate=double(regexp(data,'.......E[+-]..','match'));clear data
for ii=1:num_var
    simulation_result(ii).val=data_separate(ii:num_var:length(data_separate)-1)';
end

% simulation results of currents/voltages in each column
sim_result=[simulation_result(:).val];

% save file
save ([regexprep(filename_tr0,'.tr0','') '_results.mat'],'sim_result','simulation_result');
end