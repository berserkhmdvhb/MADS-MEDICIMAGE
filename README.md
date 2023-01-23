# MADS-MEDICIMAGE

This repository is dedicated to the group project of the course "Introduction to Deep Learning for Image Analysis and Computer Vision" at the Universeity of Luxembourg

## Installing Cmake
Firstly, choose the [Cmake version](https://cmake.org/download/), and then use it in the `wget` command below

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
To run ANTs on cluster

```
cd medicimage/
git clone git://github.com/stnava/ANTs.git
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
export ANTSPATH=/home/hamed/Documents/Projects/medical/antsbin/ANTS-build/Examples
export PATH=$PATH:$ANTSPATH

```


Do the same steps with `~/.bash_profile`.



## Run ANTs

```
antsRegistrationSyNQuick.sh -d 3 -f /scratch/users/ahusch/MSDS_19/MNI_SPACE/t1.nii -m /scratch/users/ahusch/MSDS_19/DATASETS/BRATS_dataset/imagesTr/BRATS_003.nii -o BRATS_003_mapped
```

