%Kyle Baylous %SBU ID: 111374388
function gene=fn_DNA(num)
%this function generates random DNA genes with A G C T
%num is the amount of nucleotides the user wants
n=4;    %n is a number of nucleotides A G C T
index=num;
DNA=zeros(1,index); %need to have segemnts of 3 in entire sequence 
for i=1:index
    DNA(i)=randi([1 n]); %generate random nucelotide one by one and fill DNA
end 
%convert number to the nucleotide
%1 is A, 2 is G, 3 is C and 4 is T
%use for loop and if-elseif statement or switch-case statement
for i=1:length(DNA)
    switch DNA(i)
        case 1
            DNA(i)='A';
        case 2
            DNA(i)='G';
        case 3 
            DNA(i)='C';
        case 4
            DNA(i)='T';
    end
            
gene=char(DNA); %convert to ASCII equivalent

end