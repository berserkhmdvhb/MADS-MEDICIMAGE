# MADS-MEDICIMAGE



```
antsRegistrationSyNQuick.sh -d 3 -f /home/max5/MNI_SPACE/t1.nii -m /home/max5/Desktop/image_dl_train_set/BRATS_003.nii -o  testMNI2\

antsRegistrationSyNQuick.sh -d 3 -f /home/hamed/Documents/Projects/medical/dataset/MNI_SPACE/t1.nii -m /home/hamed/Documents/Projects/medical/dataset/imagesTr/BRATS_003.nii -o  testMNI

antsRegistrationSyNQuick.sh -f /home/hamed/Documents/Projects/medical/dataset/MNI_SPACE/t1.nii -m /home/hamed/Documents/Projects/medical/dataset/imagesTr/BRATS_200.nii -o BRATS_200_mapped

---
srun -p batch --time=49:00:0 -N 2 -c 12 --pty bash -i
module load tools/EasyBuild
eb -S ants
CFGS1=/opt/apps/resif/iris-rhel8/2020b/broadwell/software/EasyBuild/4.6.1/easybuild/easyconfigs
eb -Dr /opt/apps/resif/iris-rhel8/2020b/broadwell/software/EasyBuild/4.6.1/easybuild/easyconfigs/a/ANTs/ANTs-2.3.5-foss-2021a.eb

```

EasyBuild made life harder actually.
I resorted to building ANTs from source:


```
srun -p batch --time=24:00:0 -N 2 -c 12 --pty bash -i
wget http://www.cmake.org/files/v2.8/cmake-2.8.3.tar.gz
tar xzf cmake-2.8.3.tar.gz
cd cmake-2.8.3/
./configure --prefix=$HOME
gmake
gmake install
```

To run ANTs on cluster

```
antsRegistrationSyNQuick.sh -d 3 -f /scratch/users/ahusch/MSDS_19/MNI_SPACE/t1.nii -m /scratch/users/ahusch/MSDS_19/DATASETS/BRATS_dataset/imagesTr/BRATS_003.nii -o BRATS_003_mapped
---
