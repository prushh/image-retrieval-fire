#!/bin/bash
#SBATCH --job-name=fire-eval
#SBATCH --mail-type=ALL
#SBATCH --mail-user=davide.pruscini@studio.unibo.it
#SBATCH --time=10-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --output=eval-default.txt
#SBATCH --gres=gpu:1

. venv/bin/activate

export PYTHONPATH=${PYTHONPATH}:/public.hpc/davide.pruscini/image-retrieval-fire/utils/how
export PYTHONPATH=${PYTHONPATH}:/public.hpc/davide.pruscini/image-retrieval-fire/utils/cnnimageretrieval-pytorch
export PYTHONPATH=${PYTHONPATH}:/public.hpc/davide.pruscini/vision-env/utils/asmk

python3 fire/evaluate.py fire/eval_fire.yml -e eval_default
