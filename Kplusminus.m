%Kyle Baylous  SBU ID: 111374388
%Separate positive and negative data from K.txt
%BME304 PS 2a   

%Clear workspace and command window
clear
clc

%Create Kdata dataset using dataset function 
Kdata = dataset('File','K.txt');

%Find positive indices of Log2Ratio in Kdata using logic operator >
Kdata_pos_indices = (Kdata.Log2Ratio > 0);

%Find postive values of Log2Ratio in Kdata using Kdata_pos_indices variable
%which is a logic array
Kdata_pos_values = Kdata.Log2Ratio(Kdata_pos_indices);

%Find the corresponding ID using the indices of positive values 
Kdata_pos_associated_ID = Kdata.GeneID(Kdata_pos_indices);

%Make column vector with appropriate rows for new dataset formatting
poscolumn = zeros(numel(Kdata_pos_values),1);

%Make complete positive dataset, use poscolumn variable as input to format
%the new dataset, name the columns GeneID and Log2Ratio like original file
posdataset = dataset(poscolumn,poscolumn, 'VarNames', {'GeneID', 'Log2Ratio'});

%Fill in first column of posdataset with ID information
posdataset.GeneID = Kdata_pos_associated_ID;

%Fill in second column of posdataset with positive values of Log2Ratio
posdataset.Log2Ratio = Kdata_pos_values;

%Export the positive data set as K+.txt using export function
export(posdataset,'File','K+.txt')

%_____________________________________________________

%Find negative indices of Log2Ratio in Kdata
Kdata_neg_indices = (Kdata.Log2Ratio < 0);

%Find negative values of Log2Ratio in Kdata using indices
Kdata_neg_values = Kdata.Log2Ratio(Kdata_neg_indices);

%Find the corresponding ID using the indices of negative values
Kdata_neg_associated_ID = Kdata.GeneID(Kdata_neg_indices);

%Make column vector with appropriate rows
negcolumn = zeros(numel(Kdata_neg_values),1);

%Make complete negative dataset, use negcolumn as input to format the new
%dataset, name the columns GeneID and Log2Ratio like the original file
negdataset = dataset(negcolumn,negcolumn, 'VarNames', {'GeneID', 'Log2Ratio'});

%Fill in first column with ID information
negdataset.GeneID = Kdata_neg_associated_ID;

%Fill in second column with negative values of Log2Ratio
negdataset.Log2Ratio = Kdata_neg_values;

%Export the negative data set as K-.txt using export function
export(negdataset,'File','K-.txt')

