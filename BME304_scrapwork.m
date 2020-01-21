%Separate K data
%BME304

%This script opens and reads a data file in order to plot the data using textscan 
%Kyle Baylous SBU ID: 111374388
clear
clc
%Choose file

fid=fopen('K.txt');

%Error checking for opening the file
while fid==-1
    disp('File opening unsuccessful')
    filename=input('Choose the file by typing it: ','s');
    fid=fopen(filename);
end
%Read in the header 
[header] = textscan(fid,'%s',3);

header1 = string(header{1}{1});
header2 = string(header{1}{2});

%create headers as strings
geneIDheader = header1 + " " + header2;
log2ratioheader = string(header{1}{3});

%get data 
data=textscan(fid,'%s %f');

%set ID names as strings
geneIDstr = string(data{1});

%get values for log2ratio
log2ratio_values=data{2};

%get indices for neg and pos values
neg_indices = log2ratio_values < 0;
pos_indices = log2ratio_values > 0;

%get pos ID names 
positive_value=log2ratio_values(log2ratio_values > 0);
pos_associated_ID = geneIDstr(pos_indices);

%get neg ID names 
negative_value=log2ratio_values(log2ratio_values < 0);
neg_associated_ID = geneIDstr(neg_indices);

%negative data
negmatrix1 = [geneIDheader];

%create column one for neg data matrix
for i = 1:length(neg_associated_ID)
    
append = neg_associated_ID(i);
negmatrix1 = [negmatrix1; append];

end

negmatrix2 = [log2ratioheader];

%create column two for neg data matrix
for i = 1:length(neg_associated_ID)
    
append = negative_value(i);
negmatrix2 = [negmatrix2; append];

end 
 
%final matrix for negative data with names/IDs and values
negfinal = [negmatrix1 negmatrix2];


%positive data
posmatrix1 = [geneIDheader];

%create column one for pos data matrix
for i = 1:length(pos_associated_ID)
    
append = pos_associated_ID(i);
posmatrix1 = [posmatrix1; append];

end 

posmatrix2 = [log2ratioheader];

%create column two for pos data matrix
for i = 1:length(neg_associated_ID)
    
append = positive_value(i);
posmatrix2 = [posmatrix2; append];

end 
 
%final matrix for positive data with names/IDs and values
posfinal = [posmatrix1 posmatrix2];

%save data as txt files
negfileID = fopen('K-.txt','w');
fmt = '%12s %12s\n';
fprintf(negfileID,fmt,negfinal');
fclose(negfileID);

posfileID = fopen('K+.txt','w');
fmt = '%12s %12s\n';
fprintf(posfileID,fmt,posfinal');
fclose(posfileID);

%close K.txt
close=fclose(fid);
if close==0
    disp('File close was sucessful')
else 
    disp('File close was unsuccessful')
end 

%_____________________________________________
%Filter Z data above 1
%BME304

%This script opens and reads a data file in order to plot the data using textscan 
%Kyle Baylous SBU ID: 111374388
clear
clc
%Choose file

fid=fopen('Z.txt');

%Error checking for opening the file
while fid==-1
    disp('File opening unsuccessful')
    filename=input('Choose the file by typing it: ','s');
    fid=fopen(filename);
end
%read in header 
[header] = textscan(fid,'%s',3);

%convert header to strings
header1 = string(header{1}{1});
header2 = string(header{1}{2});

%save headers
geneIDheader = header1 + " " + header2;
log2ratioheader = string(header{1}{3});

%read data
data=textscan(fid,'%s %f');

geneIDstr = string(data{1});

log2ratio_values=data{2};

%get indices
greaterthan_1_indices = log2ratio_values > 1;

%get associated ID values when value is greater than 1
greaterthan_1_value=log2ratio_values(log2ratio_values > 1);
greaterthan_1_associated_ID = geneIDstr(greaterthan_1_indices);

%greater than 1 data
great1matrix_1 = [geneIDheader];

%make first column of IDs
for i = 1:length(greaterthan_1_associated_ID)
    
append = greaterthan_1_associated_ID(i);
great1matrix_1 = [great1matrix_1; append];

end

great1matrix_2 = [log2ratioheader];

%make second column of values
for i = 1:length(greaterthan_1_associated_ID)
    
append = greaterthan_1_value(i);
great1matrix_2 = [great1matrix_2; append];

end 
 
%make final matrix output with two columns 
great_than1_final = [great1matrix_1 great1matrix_2];

%save as txt file
great1fileID = fopen('Z_above1.txt','w');
fmt = '%12s %12s\n';
fprintf(great1fileID,fmt,great_than1_final');
fclose(great1fileID);


%close Z.txt
close=fclose(fid);
if close==0
    disp('File close was sucessful')
else 
    disp('File close was unsuccessful')
end 