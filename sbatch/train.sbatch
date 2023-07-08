#!/bin/bash
#SBATCH --job-name=fire-train
#SBATCH --mail-type=ALL
#SBATCH --mail-user=davide.pruscini@studio.unibo.it
#SBATCH --time=10-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --output=train-default.txt
#SBATCH --gres=gpu:1

. ../venv/bin/activate

export PYTHONPATH=${PYTHONPATH}:/public.hpc/davide.pruscini/image-retrieval-fire/utils/how
export PYTHONPATH=${PYTHONPATH}:/public.hpc/davide.pruscini/image-retrieval-fire/utils/cnnimageretrieval-pytorch
export PYTHONPATH=${PYTHONPATH}:/public.hpc/davide.pruscini/vision-env/utils/asmk

python3 fire/train.py fire/train_fire.yml -e train_default
