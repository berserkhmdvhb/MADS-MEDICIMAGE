import nibabel as nib
import numpy as np
import os

     
     
# https://nifti.nimh.nih.gov/nifti-1/documentation/nifti1fields/nifti1fields_pages/qsform.html/document_view

dl = os.listdir('imagesTr')

MNI = []
for name in dl:
	formatt = name.split(".")
	if formatt[1]== "nii":
		image = nib.load(f"./imagesTr/{name}") 
		hdr = image.header
		if (hdr['sform_code'] == 4):
			MNI.append("TRUE")

print(MNI)
	
    
