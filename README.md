# MADS-MEDICIMAGE



EasyBuild made life harder actually.
I resorted to building ANTs from source:

## Installing Cmake

```
srun -p batch --time=24:00:0 -N 2 -c 12 --pty bash -i
wget https://github.com/Kitware/CMake/releases/download/v3.25.2/cmake-3.25.2.tar.gz
tar xzf cmake-3.25.2.tar.gz
cd cmake-3.25.2/
./configure --prefix=$HOME
gmake
gmake install

cd medicimage/
git clone git://github.com/stnava/ANTs.git


```


## Install ANTs
To run ANTs on cluster

```
antsRegistrationSyNQuick.sh -d 3 -f /scratch/users/ahusch/MSDS_19/MNI_SPACE/t1.nii -m /scratch/users/ahusch/MSDS_19/DATASETS/BRATS_dataset/imagesTr/BRATS_003.nii -o BRATS_003_mapped
```
