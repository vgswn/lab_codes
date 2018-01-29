# -------------------------------------------------------------------------------------------------------------------------------------------------------#
# A python program (script) to get gabor filtered feature data from list of images in current folder
# -------------------------------------------------------------------------------------------------------------------------------------------------------#



# -------------------------------------------------------------------------------------------------------------------------------------------------------#
# Importing required python dependencies (modules) 
# -------------------------------------------------------------------------------------------------------------------------------------------------------#

import numpy as np
from matplotlib import pyplot as plt
import sys
import pickle
import cv2
import glob



# -------------------------------------------------------------------------------------------------------------------------------------------------------#
# Function Definitions begin . . .
# -------------------------------------------------------------------------------------------------------------------------------------------------------#

def get_pickle_data(filename):				# A helper function to get data from a pickle with given filename
	X = pickle.load(open(filename,'rb'))
	return X


def save_pickle(X,filename):				# A helper function to save data in the form of pickle, with given filename
	pickle.dump(X,open(filename,'wb'))


def build_filters():								# Function to build gabor filter bank
	filters = []									# List of different gabor filters
	ksize = 6										# Size of kernel(filter/mask) of each gabor filter (6x6 matrix)
	for theta in np.arange(0, np.pi, np.pi / 16):	# Varying theta parameter for response in each of orientations : 0, PI/16, 2PI/16 , . . . , PI
		lambda_list = [7, 6.75, 6.5, 6.25, 6]		# Varying different lambda values for each orientation
		for lambd in lambda_list:
			kern = np.real(cv2.getGaborKernel((ksize, ksize), 2.7, theta, lambd, 0.3, 0, ktype=cv2.CV_32F))	# Open cv function to get gabor filter(kernel)
			kern /= (2*kern.sum())					# Normalize the filter by dividing each element of filter by 2 times the sum of all values in filter
			filters.append(kern)					# Append current filter to filter bank (filter list)
	return filters									# Returen filter list


def process(img, filters):							# Function to apply filters from filter bank on a given image
	accum = np.zeros_like(img)						# 2-D matrix to store filtered image response, initialized with zeros, of same size as image
	for kern in filters:							# For each kernel(filter) in list of filters (filter bank) 
		fimg = cv2.filter2D(img, cv2.CV_8UC3, kern)	# Open cv function to get reponse of image for filter, uses convolution of filter on padded image
		np.maximum(accum,fimg,accum)				# Taking maximum intensity for each pixel co-ordinate, to recognize overall response for all filters
	return accum									# Return filtered image


def avg_response(img):								# Function to find average intensity in filterd image
	response_sum = 0
	for i in range(0,img.shape[0]):
		for j in range(0,img.shape[1]):
			response_sum = response_sum + img[i,j]
	response_sum = response_sum / img.shape[0]		# img.shape[0] returns number of rows
	response_sum = response_sum / img.shape[1]		# img.shape[1] returns number of columns
	return response_sum

def get_feature(img):								# Function to create feature vector from gabor filtered image
	avg = avg_response(img)							# variable avg contains average response of intensities in gabor filtered image
	feature = []									# list of features
	for i in range(0,176,11):						# segmenting image in windows of 11x11
		for j in range(0,176,11):					
			x = -1									# initializing x-co-ordinate to -1 in case no pixel found in window with intensity > avg intensity
			y = -1								    # initializing y-co-ordinate to -1 in case no pixel found in window with intensity > avg intensity			
			max_int = -1							# initializing max intensity to -1	
			for k in range(i,i+11):					# Loop for each pixel in 11x11 window	
				for l in range(j,j+11):
					if(img[k][l] > avg and img[k][l] > max_int):	# check if pixel intensity > avg intensity and more than maximum intensity so far
						max_int = img[k][l]
						x = k
						y = l
			feature.append(x)						# adding x-co-ordinate of pixel to feature list
			feature.append(y)						# adding y-co-ordinate of pixel to feature list
			feature.append(max_int)					# adding maximum intensity of pixel to feature list
	feature = np.array(feature)						# converting feature list to feature array
	feature = feature.reshape(1,feature.shape[0])	# converting feature to a column vector
	return feature									# returning feature vector for gabor filtered image

# -------------------------------------------------------------------------------------------------------------------------------------------------------#
# Function Definitions end . . . 
# -------------------------------------------------------------------------------------------------------------------------------------------------------#



# -------------------------------------------------------------------------------------------------------------------------------------------------------#
# Here the program execution begins . . .
# -------------------------------------------------------------------------------------------------------------------------------------------------------#

image_list = []								# Image_List[i] Holds Pixel Matrix of ith Image, Here total number of images = 213
for filename in glob.glob('./*.tiff'):		# To extract filenames of all files in this folder with file extension ".tiff"
	img = cv2.imread(filename,0)			# Reading an image with given filename using opencv function cv2.imread(), 0 specifies to read image as grayscale
	img = img[58:234,41:217]				# Selecting part of image within larges Bounding box for faces within images, obtained by face detection
	image_list.append(img)					# (contd) using haar cascade : (Link)"https://realpython.com/blog/python/face-recognition-with-python/"

filters = build_filters()					# Obtain gabor filter bank

data = np.zeros((213,768))					# 2-D matrix to store feature-vectors, dimensions = No.of.samples x Length.of.feature.vector

for i in range(len(image_list)):					# Loop for each image to apply filters from filter bank
	filtered_img = process(image_list[i],filters)	# Obtain gabor filtered image
	feature = get_feature(filtered_img)				# Obtain feature vector from filtered image
	for j in range(0,768):							# Loop for each feature in feature vector
		data[i][j] = feature[0][j]					# Save feature vector in data matrix

save_pickle(data,'feature.pickle')					# Save feature selected image data in file "feature.pickle" for further use

# -------------------------------------------------------------------------------------------------------------------------------------------------------#
# Here the program execution ends . . .
# -------------------------------------------------------------------------------------------------------------------------------------------------------#
