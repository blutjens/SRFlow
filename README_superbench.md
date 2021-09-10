

# Run
```
ssh -L8848:localhost:8848 kerberos@txe1-login.mit.edu
git clone --branch superbench git@github.com:blutjens/SRFlow.git
conda create --new superbench
conda activate superbench
mkdir /state/partition1/user/$USER
export TMPDIR=/state/partition1/user/$USER
conda install python==3.7

pip install --upgrade pip        # Update pip
pip install -r requirements.txt  # Install the exact same packages that we used

wget --continue http://data.vision.ee.ethz.ch/alugmayr/SRFlow/datasets.zip
unzip datasets.zip
rm datasets.zip

wget --continue http://data.vision.ee.ethz.ch/alugmayr/SRFlow/pretrained_models.zip
unzip pretrained_models.zip
rm pretrained_models.zip

tmux new -s pce-sess
LLsub -i -s 20 -g volta:1
conda activate superbench
module load cuda/11.0
```
## Display images
jupyter notebook --port 8848 SRFlow/results

## Visualize tensorboard
ssh -L6007:localhost:6007 kerberos@txe1-login.mit.edu
mkdir /state/partition1/user/$USER
export TMPDIR=/state/partition1/user/$USER
tensorboard --port 6007 --logdir SRFlow/experiments/train/tb