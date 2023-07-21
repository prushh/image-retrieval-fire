# Image Retrieval using FIRe

[![python](https://img.shields.io/badge/python-3.9-3776AB?logo=python)](https://www.python.org/)
[![torch](https://img.shields.io/badge/torch-1.8.1%2Bcu111-EE4C2C?logo=pytorch)](https://pytorch.org)
[![torchvision](https://img.shields.io/badge/torchvision-0.9.1%2Bcu111-EE4C2C?logo=pytorch)](https://pytorch.org/vision/)

Project for the course "Computer Vision" of the University of Bologna, A.Y. 2021/2022.

## Getting started

The repository contains 4 submodules:

- [FIRe](https://github.com/prushh/fire/), the official model implementation presented at _ICLR 2022_ [[paper]](https://doi.org/10.48550/arXiv.2201.13182)
- [HOW](https://github.com/prushh/how/), the official local descriptors implementation presented at _ECCV 2020_ [[paper]](https://doi.org/10.48550/arXiv.2007.13172)
- [ASMK](https://github.com/prushh/asmk/), the official evaluation framework implementation presented at _ICCV 2013_ [[paper]](https://doi.org/10.1109/ICCV.2013.177)
- [cnnimageretrieval-pytorch](https://github.com/prushh/cnnimageretrieval-pytorch), a toolbox that implements training and testing for the approaches presented at _ECCV 2016_ [[paper-1]](https://doi.org/10.48550/arXiv.1604.02426) and published in the _IEEE Transactions on Pattern Analysis and Machine Intelligence_ journal [[paper-2]](https://doi.org/10.48550/arXiv.1711.02512)

To clone it correctly, run the following command in the terminal:

```bash
git clone --recurse-submodules https://github.com/prushh/image-retrieval-fire
```

Note that the last submodule clones a specific branch called `tested_with_fire`, created specifically to refer to the latest release, the one tested in the FIRe project.

### Setup

To run the project, you will need to have [Python](https://www.python.org/) installed. For best performance, it is recommended to have [CUDA](https://developer.nvidia.com/cuda-zone) installed in the system and a GPU with at least 10GB of DRAM.

To install the dependencies for the project, you can use the following commands to create and activate a virtual environment inside the project folder and then install the dependencies from the _requirements.txt_ file:

```bash
# Creation and activation virtual env
python3 -m virtualenv venv
source venv/bin/activate

# Installing packages
pip3 install --no-cache-dir -r requirements.txt
```

It is also necessary to set the `PYTHONPATH` environment variable, you can use the following commands:

```bash
export PYTHONPATH=${PYTHONPATH}:$(absolute path HOW)
export PYTHONPATH=${PYTHONPATH}:$(absolute path ASMK)
export PYTHONPATH=${PYTHONPATH}:$(absolute path cnnimageretrieval-pytorch)
```

### Usage

Our executions were performed on UniBO's [HPC Cluster](https://disi.unibo.it/it/dipartimento/servizi-tecnici-e-amministrativi/servizi-informatici/utilizzo-cluster-hpc) that provides [Slurm Workload Manager](https://slurm.schedmd.com/) for the job submission.
Note that all necessary datasets are automatically downloaded during the first execution, and they take up several GBs.

#### Training

```bash
python3 fire/train.py fire/train_fire.yml -e <name_expriment_folder>
```

#### Evaluation

```bash
python3 fire/evaluate.py fire/eval_fire.yml -e <name_expriment_folder> -ml <name_expriment_folder>
```

For more details, see the [README.md](https://github.com/prushh/fire/blob/main/README.MD) of the FIRe repository.

## Task

Prepare a detailed seminar on a "recent" scientific paper related to the topics of the course.
This presentation should also include a detailed description/analysis of the source code associated with the scientific paper and the results achieved in it:

- If the latter is not available, the student should try to re-implement the relative model, replicating at least one experiment from the article
- You can also try simple modifications to the original solution proposed in the paper

### Model

![fire-architecture](https://github.com/prushh/image-retrieval-fire/blob/main/images/fire-architecture.png)

### Experiments

Repeating the original solution proposed in the paper was not possible due to the _CUDA out of memory_ error.
We therefore tried the following two configurations, starting with the [pretrained model](http://download.europe.naverlabs.com/ComputerVision/FIRe/pretraining/fire_imagenet.pth):

1. Freeze the CNN and train only the LIT module
2. Reduce the number of hard negative images inside the tuple from 5 to 3
   - The model sample tuples composed of one query image, one positive image and 5 hard negatives
   - By studying _Appendix A.2_ of the FIRe [paper](https://doi.org/10.48550/arXiv.2201.13182), we gained insights into the impact of hard negatives on performance, and how reducing the number of hard negatives per training tuple does not excessively reduce performance

## License

The code is distributed under the MIT License. See [LICENSE](https://github.com/prushh/image-retrieval-fire/blob/main/LICENSE) for more information. It is based on code from FIRe, HOW, cirtorch and ASMK that are released under their own license.
