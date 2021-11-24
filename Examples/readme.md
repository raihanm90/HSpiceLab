Three examples are shown to demonstrate the usage of the function. The detailed circuit diagram for these examples can be found in the
<a href=https://inst.eecs.berkeley.edu/~ee105/fa15/Tutorials/HSPICE_Tutorial.pdf>HSpice Tutorial</a>.
# tr_example
.tr0 file was generated from the following tr_example.sp file.
```
EE105 SPICE Tutorial Example 1 - Simple RC Circuit
vs vs gnd PWL(0s 0V 5ms 0V 5.001ms 5V 10ms 5V)
r1 vs vo  1k
c1 vo gnd 1uF
.tran 0.01ms 10ms
.option post=2
.option POST_VERSION=9601
.end
```
Five signals, saved in the **tr_example.tr0** file after simulating **tr_example.sp**, were extracted into the sim_results variable.  
For example, **sim_results(3).var_name=v(vo)** indicates that **sim_results(3).val** contains the computed voltages across the node vo at different sweep time, **sim_results(1).val**.
Later, time dependent output voltage along with the circuit current were also plotted to show the effect of the RC time constant.

# sw_example
.sw0 file was generated from the following sw_example.sp file.
```
EE105 SPICE Tutorial Example 3 - Simple Diode Circuit
.model tut_diode d (is=1e-14 vj=0.6 rs=10)
vs vs gnd 5V
rs vs vd 5k
d1 vd gnd tut_diode
.dc vs 0V 5V 0.01V
.option post=2
.option POST_VERSION=2001
.end
```
Five signals, saved in the **sw_example.sw0** file after simulating **sw_example.sp**, were extracted into the sim_results variable.  
For example, **sim_results(3).var_name=v(vd)** indicates that **sim_results(3).val** contains the computed voltages across the diode at different sweep voltages.
Later, IV characteristics of the diode IV was also plotted from the results of the DC sweep.

# ac_example
.ac0 file was generated from the following ac_example.sp file
```
EE105 SPICE Tutorial Example 4 - Simple RC High-Pass Filter
vs vs gnd ac 1V
c1 vs vo 1nF
r1 vo gnd 1k
.ac dec 500 100 1G
.option post=2
.plot AC I(r1) VM(vo) VR(vo) VI(vo) VP(vo) VDB(vo) VT(vo) IT(r1) IM(r1) 
.end
```
Nineteen signals, saved in the **ac_example.ac0** file after simulating **ac_example.sp**, were extracted into the sim_results variable.  
For example, **sim_results(4).var_name=v(vo)_real** and **sim_results(4).var_name=v(vo)_imag** indicate that **sim_results(4).val** and **sim_results(5).val** contain the 
real and imaginary component of computed output voltage at different frquencies, **sim_results(1).val**. Similarly **sim_results(16).var_name=vdb(vo)** indicates the dB value
of the vo magnitude. To compare this value with the computed real and imaginary singal components vdB_manual and vdB_direct were calculated and matched with each other.
Later, Bode plot of the output voltage was also plotted to show the effect of the High-Pass Filter.

