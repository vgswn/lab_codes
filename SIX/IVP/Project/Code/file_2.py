# -------------------------------------------------------------------------------------------------------------------------------------------------------#
# A python program (script) to create .arff (attribute relation file format) as input for weka from the feature data saved in pickle
# -------------------------------------------------------------------------------------------------------------------------------------------------------#



# -------------------------------------------------------------------------------------------------------------------------------------------------------#
# Importing required python dependencies (modules)
# -------------------------------------------------------------------------------------------------------------------------------------------------------#

import numpy as np
import pickle
import glob



# -------------------------------------------------------------------------------------------------------------------------------------------------------#
# Function Definitions begin . . .
# -------------------------------------------------------------------------------------------------------------------------------------------------------#

def get_pickle_data(filename):							# A helper function to get data from a pickle with given filename
	X = pickle.load(open(filename,'rb'))
	return X

def save_pickle(X,filename):							# A helper function to save data in the form of pickle, with given filename
	pickle.dump(X,open(filename,'wb'))

# -------------------------------------------------------------------------------------------------------------------------------------------------------#
# Function Definitions end . . .
# -------------------------------------------------------------------------------------------------------------------------------------------------------#



# -------------------------------------------------------------------------------------------------------------------------------------------------------#
# Here the program execution begins . . .
# -------------------------------------------------------------------------------------------------------------------------------------------------------#

Data = get_pickle_data('feature.pickle') 				# 2-D matrix containing feature data, dimension = No.of.samples x Length.of.feature.vector

Labels = []												# List of labels (emotion) corresponding to each image

for filename in glob.glob('./*.tiff'):					# Loop for each filename in current directory with file extension ".tiff"
    Labels.append(filename.split('.')[2][0:2])			# Append emotion mentioned in filename, to list of labels 

target_file = open('features.arff','w')					# Create a new file named features.arff to save feature data in arff format
target_file.write("@relation emotionClassification\n")
target_file.write("\n")

for i in range(1,769):									# Printing number of features(attributes) and their data types
	target_file.write("@attribute")
	target_file.write(" feature"+str(i))
	target_file.write(" numeric")
	target_file.write("\n")

target_file.write("@attribute emotion {SU,NE,HA,AN,FE,SA,DI}\n")	# Printing last attribute (Class Label)
target_file.write("\n")
target_file.write("@data\n")

for i in range(0,213):									# Loop for each image sample
	for j in range(0,768):								# Loop for each feature for a given image sample
		target_file.write(str(Data[i,j]))				# Printing features separated by comma
		target_file.write(",")
	target_file.write(Labels[i])						# Printing Class Label for each image sample
	target_file.write("\n")

# -------------------------------------------------------------------------------------------------------------------------------------------------------#
# Here the program execution ends . . .
# -------------------------------------------------------------------------------------------------------------------------------------------------------#
