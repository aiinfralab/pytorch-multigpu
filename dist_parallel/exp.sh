#!/bin/bash
#SBATCH --job-name=mgpu4
#SBATCH --partition=batch
#SBATCh --nodes=1
#SBATCH --gpus=2
#SBATCH --mem=8gb


export MASTER_PORT=12340
export WORLD_SIZE=1
echo "NODELIST="${SLURM_NODELIST}
master_addr=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
export MASTER_ADDR=$MASTER_ADDR
echo "MASTER_ADDR="$MASTER_ADDR
srun python3 train.py --gpu_devices 0 1 --batch_size 512
