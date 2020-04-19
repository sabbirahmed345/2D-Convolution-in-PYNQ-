# ==============================================================
# File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
# Version: 2014.2
# Copyright (C) 2014 Xilinx Inc. All rights reserved.
# 
# ==============================================================

set ::env(PATH) "$::env(PATH);C:/Xilinx/Vivado_HLS/2014.2/win64/tools/fpo_v7_0"
set ::env(PATH) "$::env(PATH);C:/Xilinx/Vivado_HLS/2014.2/win64/tools/opencv"
set ::env(PATH) "$::env(PATH);C:/Xilinx/Vivado_HLS/2014.2/win64/tools/fft_v9_0"
set ::env(PATH) "$::env(PATH);C:/Xilinx/Vivado_HLS/2014.2/win64/tools/fir_v7_0"
### C sim ###
if {![file exists csim.exe]} {
  puts "@E C-simulation is not set up properly. Please re-run csim."
  return -code error
}
set ret [catch {eval exec ./csim.exe >&@ stdout} err]
if {$ret || $err != ""} {
    if { [lindex $::errorCode 0] eq "CHILDSTATUS"} {
        set status [lindex $::errorCode 2]
        if {$status != ""} {
            puts "@E Simulation failed: Function \'main\' returns nonzero value \'$status\'."
            set ::AESL_CSIM::gnonzeroRetErr 1
            return -code error
        } else {
            puts "@E Simulation failed."
            return -code error
        }
    } else {
        if { [regexp {segmentation violation} $err] } {
            puts "@E Simulation failed: SIGSEGV."
        } else {
            puts "@E Simulation failed."
        }
        return -code error
    }
}

