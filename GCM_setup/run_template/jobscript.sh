#!/bin/bash

#SBATCH -p parallel
#SBATCH -n 1000
#SBATCH -t 08:00:00 

NPROC=1000
module purge
module load all
module load intel/16.1
module load gcc/4.9.3
module load netcdf/4.4.0
module load netcdf-fortran/intel_16.1/4.4.2
module load openmpi/intel_16.1/1.10.2

echo $SLURM_NTASKS
cd $SLURM_SUBMIT_DIR

mpiexec -n $NPROC ./mitgcmuv

./most_recent_pickup.sh
sbatch jobscript.sh

