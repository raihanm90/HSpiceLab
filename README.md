# HSpiceLab
MATLAB toolbox to read HSPICE generated and ASCII formatted .tr#/.sw#/.ac# output files.  
For a note, ASCII formatted file can be created using .OPTION post=2 in the .sp file. 

## read_hspice_tr_sw_ac.m  
This function reads a ASCII formatted HSPICE output file (.option post=2) 'filename.tr#' or 'filename.sw#' or 'filename.ac#' and saves all the signals in the variable 'simulation_result' as a structure.  
### Description of the input/output:
Input: filename = name of the ASCII formatted HSpice output file (.tr#/.ac#/.sw#) 
Output: simulation_result = a structure (2 fields) that contains the contents from the HSPICE file.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;simulation_result(#).var_name=name of the signals present in the file (in the same order as the file).  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;simulation_result(#).val=a vector contains the values of the signal with the name simulation_result(#).var_nam  
### .tr#/.sw# files:
.tr# and .sw# files are generated for transient (.TRAN) analysis and DC (.DC) analysis respectively. Signal names are saved as it is.  
### .ac# files:
.ac# files are generated for AC (.AC) analysis. Signal names are saved in the following manner:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;node voltages and branch/element currents = .var_name_real and .var_name_imag for real and imaginary values of the signal.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MmN(xx)[Mm=V/Im,N=M,R,I,P,DB,T,xx=node/element] = signal names are saved as it is.
## Examples:
An example for each output file type is shown in the 'Examples' folder to demonstrate the usage of function.

[![View read_hspice_tr0 on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/101043-read_hspice_tr0)
