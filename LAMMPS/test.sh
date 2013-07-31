#!/bin/bash
cd bench
for i in in.chain in.chain.scaled in.chute in.chute.scaled in.eam in.lj in.rhodo in.rhodo.scaled 
do 
echo $i
time mpiexec.hydra -np 16 -host localhost     \
          -env OMP_NUM_THREADS=1            \
          /share/apps/LAMMPS/sandybridge/12Aug13/ics-2013/lmp_NeSI-sandybridge-ics-2013 \
          -in $i 
done | tee  benchmarks_results.dat
