# MADS-MEDICIMAGE
This repository is dedicated to the group project of the course "Introduction to Deep Learning for Image Analysis and Computer Vision" at the Universeity of Luxembourg. 

# Installation of ANTs
## Instal Cmake
`Cmake` is a requirement for installing ANTs from source. Choose the [Cmake version](https://cmake.org/download/), and then use it in the `wget` command below

```bash
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

```bash
cd medicimage/
git clone https://github.com/ANTsX/ANTs
mkdir antsbin
cd antsbin
ccmake ../ANTs
```
Navigate into cmake and type `c` and then `g`  then exit back to the
terminal.

```bash
make -j 4
```

Navigate to the root folder contating `ANTs` and `antsbin` 

```bash
cp ANTs/Scripts/* antsbin/ANTS-build/Examples/
```

Now we need to set the bashrc paths accordingly:

```bash
nano ~/.bashrc
```

Add the following paths but adjust it to your own machine:


```bash
export ANTSPATH=/home/users/hvaheb/medicimg/antsbin/ANTS-build/Examples
export PATH=$PATH:$ANTSPATH
```


Do the same steps with `~/.bash_profile`.




**Side Note**: To copy output images from cluster to local machine, the following

```bash
scp -r iris-cluster:/home/users/hvaheb/medicimg/output/ /home/hamed/Documents/Projects/medical/dataset/output/
```



# Image Restoration

Samples were chosen from the [BRATS dataset](https://www.med.upenn.edu/cbica/brats2020/data.html) to apply image registration using ANTs software.
A particular sample used is the `BRATS_003.nii.gz` file.

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

The [reg.py](https://github.com/berserkhmdvhb/MADS-MEDICIMAGE/blob/main/TASK4/header/header.py) script is written to check for all `nii` files in a directory with name `imagesTr` and to append `TRUE` if the the qs-form had value 4, i.e., the image was registered with MNI template.
For all the images in BERTS dataset, the header's number was 4 i.e., they were scanner-based based coordinates.


## Mapping to Templates
In this sections, all `nii` files' visualizations are obtained from screenshots of the [ITK-SNAP](http://www.itksnap.org/pmwiki/pmwiki.php) software.

The initial sample image `BRATS_003.nii.gz` is visualized in the following:


<p float="left">
<img src="TASK4/output/BRETS/initial/snapshot0004.png" align="center" style="width: 23%;"/>
<img src="TASK4/output/BRETS/initial/snapshot0005.png" align="center" style="width: 23%;"/>
<img src="TASK4/output/BRETS/initial/snapshot0006.png" align="center" style="width: 23%;"/>
</p>

Evidenced by the figures, there is a bit of tilt in the horizontal direction, which is speculated to be attributed to the scanner-based (x,y,z) coordinate system, as investigated in [Header](#Header). To restore image to a proper alignment space, the [MNI](#MNI) template and [segmentation](#MNI) template are used.


### MNI

Provided in the cluster is the MNI space coordinated image `t1.nii`, whic is used to transform the original image `BRATS_003.nii` to `t1.nii`, which is also called the moving image.
The `antsRegistration` commaned was used to map the original image to the MNI space, as follows:

```
antsRegistrationSyNQuick.sh -d 3 -f /scratch/users/ahusch/MSDS_19/MNI_SPACE/t1.nii -m /scratch/users/ahusch/MSDS_19/DATASETS/BRATS_dataset/imagesTr/BRATS_003.nii.gz -o /home/users/hvaheb/medicimg/output/BRATS_003_mapped -j 12
```

In below the outputs are presented:

<p float="left">
<img src="TASK4/output/BRETS/initial/snapshot0004.png" align="center" style="width: 23%;"/>
<img src="TASK4/output/BRETS/initial/snapshot0005.png" align="center" style="width: 23%;"/>
<img src="TASK4/output/BRETS/initial/snapshot0006.png" align="center" style="width: 23%;"/>
</p>

### Segmentation

<p float="left">
<img src="TASK4/output/BRETS/warped-mni/snapshot0007.png" align="center" style="width: 25%;"/>
<img src="TASK4/output/BRETS/warped-mni/snapshot0008.png" align="center" style="width: 25%;"/>
<img src="TASK4/output/BRETS/warped-mni/snapshot0009.png" align="center" style="width: 25%;"/>
</p>

```
antsRegistrationSyNQuick.sh -d 3 -f /scratch/users/ahusch/MSDS_19/MNI_SPACE/simple_segmentation.nii  -m /scratch/users/ahusch/MSDS_19/DATASETS/BRATS_dataset/imagesTr/BRATS_003.nii.gz -o /home/users/hvaheb/medicimg/output/seg/BRATS_003_mapped_seg -j 12
```



