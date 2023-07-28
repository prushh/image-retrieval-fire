#!/bin/bash
#SBATCH --job-name=fire-train
#SBATCH --mail-type=ALL
#SBATCH --mail-user=nome.cognome@unibo.it
#SBATCH --time=10-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --output=train.txt
#SBATCH --gres=gpu:1

. venv/bin/activate

export PYTHONPATH=${PYTHONPATH}:/public.hpc/davide.pruscini/image-retrieval-fire/utils/how
export PYTHONPATH=${PYTHONPATH}:/public.hpc/davide.pruscini/image-retrieval-fire/utils/cnnimageretrieval-pytorch
export PYTHONPATH=${PYTHONPATH}:/public.hpc/davide.pruscini/image-retrieval-fire/utils/asmk

python3 fire/train.py fire/train_fire.yml -e train_experiment_folder
