%This script read the DNA fragment and encode to the amino acid sequence
%Name: Kyle Baylous
%Student ID: 111374388

load('FinalExamVariables.mat')

%ask and input user to enter the number of nucleotides
n=input('Please enter the number of nucelotides: ');

%call function fn_DNA to generate random imaginary DNA
DNA=fn_DNA(n);

%pre-allocate "DNAcode" to store encoded DNA result
DNAcode=''; %empty string

%check the 3 consecutive elements (DNA codons)
%and compare with the "DNA dictionary"
k=n/3;
sets=floor(k);
    for i=1:sets %Go through each triple of nucelotides
        k1=DNA(3*i-2); %iterate through each nucleotide
        k2=DNA(3*i-1);
        k3=DNA(3*i);
       
        Codon=[k1 k2 k3]; %create codon each time to match
        
        
    for j=1:64
        if strcmp(Codon,DNAcodons{1}(1,j)) %check row by row
            DNAcode=strcat(DNAcode,DNAcodons{3}(j,1));%use if statement as condition
           
        else 
        end  
    end 
    end 
    
        
        newDNAcode=DNAcode; 
    
        fprintf('The original nucelotide sequence was %s.\n',DNA) %display original DNA sequence
        fprintf('The amino acid sequence is %s.\n',newDNAcode{1}) %display the amimno acid equence
    