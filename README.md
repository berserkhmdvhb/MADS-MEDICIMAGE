# MADS-MEDICIMAGE



```
antsRegistrationSyNQuick.sh -d 3 -f /home/max5/MNI_SPACE/t1.nii -m /home/max5/Desktop/image_dl_train_set/BRATS_003.nii -o  testMNI2\

antsRegistrationSyNQuick.sh -d 3 -f /home/hamed/Documents/Projects/medical/dataset/MNI_SPACE/t1.nii -m /home/hamed/Documents/Projects/medical/dataset/imagesTr/BRATS_003.nii -o  testMNI

antsRegistrationSyNQuick.sh -f /home/hamed/Documents/Projects/medical/dataset/MNI_SPACE/t1.nii -m /home/hamed/Documents/Projects/medical/dataset/imagesTr/BRATS_200.nii -o BRATS_200_mapped

---
si -N 1 --exclusive -t 01:00:00
module load tools/EasyBuild
eb -S ants
CFGS1=/opt/apps/resif/iris-rhel8/2020b/broadwell/software/EasyBuild/4.6.1/easybuild/easyconfigs
eb -Dr CFGS1/a/ANTs/ANTs-2.3.5-foss-2021a.eb
eb -Dr /opt/apps/resif/iris-rhel8/2020b/broadwell/software/EasyBuild/4.6.1/easybuild/easyconfigs/a/ANTs/ANTs-2.3.5-foss-2021a.eb

```

