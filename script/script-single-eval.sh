#!/bin/bash

#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:tesla:1
#SBATCH --mem=8GB
#SBATCH --time 0-10:00:00

echo $SLURM_JOB_NODELIST

echo #OMP_NUM_THREADS : $OMP_NUM_THREADS

module load miniconda3

source="$CONDA_PREFIX/etc/profile.d/conda.sh"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/hpc/home/fabrizio.desantis/.conda/envs/myenv-2022.11.23/lib/

source activate /hpc/home/fabrizio.desantis/.conda/envs/myenv

python evaluation-single.py

conda deactivate