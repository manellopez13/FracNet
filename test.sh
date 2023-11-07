#!/bin/sh

#--- NAME
#SBATCH --job-name frac_test
#SBATCH --output output_test/slurm-%j.out

#--- CPU
#SBATCH --mem 64G

#--- GPU
#SBATCH -p shared-gpu
#SBATCH --gres=gpu:8,VramPerGpu:10G

#--- Time
#SBATCH -t 4:00:00

#--- Load modules.
module purge
module load GCC/10.3.0  OpenMPI/4.1.1
module load PyTorch/1.11.0-CUDA-11.3.1
module load NiBabel/3.2.1
module load matplotlib/3.4.2
module load scikit-image/0.18.1

#--- Outputs details about the node and cores used.
nvidia-smi

#--- Execute script.
python -m predict --image_dir ../data/ribfrac-val-images --pred_dir output_test --model_path output_train/model_weights.pth
