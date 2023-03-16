#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /mnt/raid0/asic/projects/NU/ETHW/manuelbv/tutorials/custom/model_dummy_linear_2w/hls4ml_prj/myproject_prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
