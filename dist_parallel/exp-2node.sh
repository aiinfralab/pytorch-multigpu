#!/bin/bash
#SBATCH --job-name=mgpu4
#SBATCH --partition=batch
#SBATCh --nodes=2
#SBATCH --gpus=10
#SBATCH --mem=8gb
#SBATCH --node_list=[27.122.137.19,34.64.225.90,35.193.103.198]
###SBATCH --gres=gpu:2


export MASTER_PORT=12340
export WORLD_SIZE=10
echo "NODELIST="${SLURM_NODELIST}
master_addr=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
export MASTER_ADDR=27.122.137.19
echo "MASTER_ADDR="$MASTER_ADDR
srun python3 train.py --gpu_devices 0 1 2 3 4 5 6 7 8 9 --batch_size 256 
