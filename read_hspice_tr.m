%Read HSPICE generated ASCII formatted .tr# files 
%% Author
%Mohammad Abu Raihan Miah
%University of California, San Diego
%ver 3.0.0, 11/16/21
%% Code description
%This Code reads the HSPICE output file 'filename.tr#' and shows the
%data as a structure, 'simulaion_result'. 
%simulation_result: data saved in structure format with the name of plotted
%                   data as the 'field'.
%
%% Example for calling this function:
% sim_data=read_hspice_tr('rcsim.tr0')
% 
%% main function
%Don't touch here
function simulation_result=read_hspice_tr(filename)

% read data from the file
filetr = fopen(filename);
content_filetr0 = textscan(filetr,'%s','HeaderLines',3);
fclose(filetr);

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
data_frmt=char(ones(1,find(char(content_str(data_start_ind))=='E',1)-1)*'.');
data_separate=double(regexp(data,[data_frmt 'E[+-]..'],'match'));clear data
for ii=1:num_var
    simulation_result(ii).val=data_separate(ii:num_var:length(data_separate)-1)';
end
end
