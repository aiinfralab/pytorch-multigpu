#!/bin/bash
#SBATCH --job-name=mgpu4
#SBATCH --partition=batch

#SBATCH --gpus=1	
#SBATCH --cpus-per-task=1
#SBATCH --gpus-per-task=1
#SBATCH --mem=10gb

export MASTER_PORT=12340
export WORLD_SIZE=1
echo "NODELIST="${SLURM_NODELIST}
master_addr=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
export MASTER_ADDR=$MASTER_ADDR
echo "MASTER_ADDR="$MASTER_ADDR
srun python3 train.py --batch_size 256
