#!/bin/bash
#SBATCH --job-name=mgpu4
#SBATCH --partition=batch
#SBATCh --nodes=2
#SBATCH --gpus=3
#SBATCH --mem=8gb
#SBATCH --gres=gpu:3


export MASTER_PORT=12340
export WORLD_SIZE=3
echo "NODELIST="${SLURM_NODELIST}
master_addr=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
export MASTER_ADDR=$MASTER_ADDR
echo "MASTER_ADDR="$MASTER_ADDR
srun python3 train.py --gpu_devices 0 1 2 --batch_size 512
