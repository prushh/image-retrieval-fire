#!/bin/bash
#SBATCH --job-name=fire-eval
#SBATCH --mail-type=ALL
#SBATCH --mail-user=nome.cognome@unibo.it
#SBATCH --time=10-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --output=eval.txt
#SBATCH --gres=gpu:1

. venv/bin/activate

export PYTHONPATH=${PYTHONPATH}:/public.hpc/davide.pruscini/image-retrieval-fire/utils/how
export PYTHONPATH=${PYTHONPATH}:/public.hpc/davide.pruscini/image-retrieval-fire/utils/cnnimageretrieval-pytorch
export PYTHONPATH=${PYTHONPATH}:/public.hpc/davide.pruscini/image-retrieval-fire/utils/asmk

python3 fire/evaluate.py fire/eval_fire.yml -e eval_experiment_folder -ml train_experiment_folder
