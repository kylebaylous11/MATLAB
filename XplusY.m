%Kyle Baylous  SBU ID: 111374388
%Merge/join X.txt and Y.txt
%BME304 PS 2a   

%Clear workspace and command window
clear
clc

%Create Xdata dataset using dataset function
Xdata = dataset('File','X.txt');

%Create Ydata dataset using dataset function
Ydata = dataset('File','Y.txt');

%Use join function to merge Xdata and Ydata, ignore overlap columns
%with the mergekeys option, can use additional options like LeftOuter
mergedx_y = join(Xdata,Ydata,'type','LeftOuter','mergekeys',true);

%Use export function to export mergedx_y dataset as X+Y.txt
export(mergedx_y,'File','X+Y.txt')

