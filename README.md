# MADS-MEDICIMAGE
This repository is dedicated to the group project of the course "Introduction to Deep Learning for Image Analysis and Computer Vision" at the Universeity of Luxembourg


## Installing Cmake
Choose the [Cmake version](https://cmake.org/download/), and then use it in the `wget` command below

```
srun -p batch --time=24:00:0 -N 2 -c 12 --pty bash -i
wget https://github.com/Kitware/CMake/releases/download/v3.25.2/cmake-3.25.2.tar.gz
tar xzf cmake-3.25.2.tar.gz
cd cmake-3.25.2/
./configure --prefix=$HOME
gmake
gmake install
```


## Install ANTs
To install ANTs on cluster:

```
cd medicimage/
git clone https://github.com/ANTsX/ANTs
mkdir antsbin
cd antsbin
ccmake ../ANTs
```
Navigate into cmake and type `c` and then `g`  then exit back to the
terminal.

```
make -j 4
```

Navigate to the root folder contating `ANTs` and `antsbin` 
```
cp ANTs/Scripts/* antsbin/ANTS-build/Examples/
```

Now we need to set the bashrc paths accordingly:

```
nano ~/.bashrc
```

Add the following paths but adjust it to your own machine:


```bash
export ANTSPATH=/home/users/hvaheb/medicimg/antsbin/ANTS-build/Examples
export PATH=$PATH:$ANTSPATH
```


Do the same steps with `~/.bash_profile`.



## Run ANTs
To run ANTs on cluster: 

```
antsRegistrationSyNQuick.sh -d 3 -f /scratch/users/ahusch/MSDS_19/MNI_SPACE/t1.nii -m /scratch/users/ahusch/MSDS_19/DATASETS/BRATS_dataset/imagesTr/BRATS_003.nii.gz -o /home/users/hvaheb/medicimg/output/BRATS_003_mapped -j 12
```

```
antsRegistrationSyNQuick.sh -d 3 -f /scratch/users/ahusch/MSDS_19/MNI_SPACE/simple_segmentation.nii  -m /scratch/users/ahusch/MSDS_19/DATASETS/BRATS_dataset/imagesTr/BRATS_003.nii.gz -o /home/users/hvaheb/medicimg/output/seg/BRATS_003_mapped_seg -j 12
```


```
scp -r iris-cluster:/home/users/hvaheb/medicimg/output/ /home/hamed/Documents/Projects/medical/dataset/output/
```
