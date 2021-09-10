#!/bin/bash

set -e # exit script if an error occurs

#source myenv/bin/activate # Install with ./setup.sh
conda activate superbench
cd code
python -m jupyter notebook demo_on_pretrained.ipynb # Start jupyter using the python from the virtual environment
