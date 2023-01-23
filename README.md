# MADS-MEDICIMAGE
This repository is dedicated to the group project of the course "Introduction to Deep Learning for Image Analysis and Computer Vision" at the Universeity of Luxembourg. 

# Installation of ANTs
## Instal Cmake
`Cmake` is a requirement for installing ANTs from source. Choose the [Cmake version](https://cmake.org/download/), and then use it in the `wget` command below

```
srun -p batch --time=24:00:0 -N 2 -c 12 --pty bash -i
wget https://github.com/Kitware/CMake/releases/download/v3.25.2/cmake-3.25.2.tar.gz
tar xzf cmake-3.25.2.tar.gz
cd cmake-3.25.2/
./configure --prefix=$HOME
gmake
gmake install
```


## Compile ANTs from source
Instructions of installing ANTs on HPC cluster:

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




**Side Note**: To copy output images from cluster to local machine, the following

```
scp -r iris-cluster:/home/users/hvaheb/medicimg/output/ /home/hamed/Documents/Projects/medical/dataset/output/
```



# Image Restoration

Samples were chosen from the [BRATS dataset](https://www.med.upenn.edu/cbica/brats2020/data.html) to apply image registration using ANTs software.


## Header 
The header of nifti files derived from BRATS were checked to have more sense of their format. Using the value of `sform_code` or `qform_code`, the coordinate system of the file is determined.
The values for these codes are defined as following:

| [qs](https://nifti.nimh.nih.gov/nifti-1/documentation/nifti1fields/nifti1fields_pages/qsform.html#refqs) form_code value:        |  (x,y,z) coordinate system refers to:           | 
|:-------------:|:-------------:|
| 0      | Arbitrary coordinates |
| 1      | Scanner-based anatomical coordinates |
| 2 | Coordinates aligned to another file's, or to anatomical "truth" |
| 3 | Coordinates aligned to Talairach-Tournoux Atlas; (0,0,0)=AC, etc. |
| 4 | MNI 152 normalized coordinates. |

The [reg.py](https://github.com/berserkhmdvhb/MADS-MEDICIMAGE/blob/main/Header/header.py) script is written to check for all `nii` files in a directory with name `imagesTr` and to append `TRUE` if the the qs-form had value 4, i.e., the image was registered with MNI template.
For all the images in BERTS dataset, the header's number was 4 i.e., they were scanner-based based coordinates.


## Mapping to Templates

### MNI
```
antsRegistrationSyNQuick.sh -d 3 -f /scratch/users/ahusch/MSDS_19/MNI_SPACE/t1.nii -m /scratch/users/ahusch/MSDS_19/DATASETS/BRATS_dataset/imagesTr/BRATS_003.nii.gz -o /home/users/hvaheb/medicimg/output/BRATS_003_mapped -j 12
```

[`tar_visnetwork`](https://github.com/berserkhmdvhb/aiinsurance/blob/main/inst/figures/tar_visnetwork.png)


### Segmentation
```
antsRegistrationSyNQuick.sh -d 3 -f /scratch/users/ahusch/MSDS_19/MNI_SPACE/simple_segmentation.nii  -m /scratch/users/ahusch/MSDS_19/DATASETS/BRATS_dataset/imagesTr/BRATS_003.nii.gz -o /home/users/hvaheb/medicimg/output/seg/BRATS_003_mapped_seg -j 12
```



