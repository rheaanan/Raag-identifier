readme 


#include this code 

multi_match <- function(x, table){
    # returns initial indicies of all substrings in table which match x
    if(length(table) < length(x)){
        #if the table is smaller than the substring return NA
        return(NA)
    }else{
        check_mat <- matrix(nrow = length(x), ncol = length(table))
        for(i in 1:length(x)){
            check_mat[i,] <- table %in% x[i]
        }
        out <- vector(length = length(table))
        for(i in 1:(length(table)-(length(x)-1))){
            check <- vector(length=length(x))
            for(j in 1:length(x)){
                check[j] <- check_mat[j,(i+(j-1))]
            }
            out[i] <- all(check)
        }
        if(length(which(out))==0){
        # if not found returns NA
            return(NA)
        }else{
        #if found returns the index of the substring
            return(which(out))
        }
    }
}

kaafi<-c("f'","d#'" ,"f'" ,"C#")
desh<-c("a'","a#'","a'","a#'")
kalyan<-c("F","d'","c'")
khamaaj<-c("d#'","d'","c'")
puriyaDhanashree<-c("e'","d'","e'","b","d'")
bhairavi<-c("c#'","b","a#")

#to use our classifier 
#keep the midi file in the folder called example_files in the tuneR package folder.
#read the midi file 

content <- readMidi(system.file("example_files", "NameOfMidiFile.mid", package="tuneR"))

#Replace the Raag Variable with the desired raag to check.

ans = multi_match(RaagToBeComparedfor, sequence)

#ans will be the points of occurence of the raag characteristic

numOfOccurences =length(ans)
# should give the number of times the characteristis appeared in the midi file

EXAMPLE of input and output 

> content <- readMidi(system.file("example_files", "bajesargam.mid", package="tuneR"))
>   mynotes <- getMidiNotes(content)
>   sequence<-mynotes$notename
> sequence
 [1] d#' c'  G#  d#' f'  f'  d#' d#' f'  g#' g'  f'  A#  c'' g#' g'  f'  a'  a#' a'  a#' a' 
[23] a#' a'  a#'
132 Levels: C,,, C#,,, D,,, D#,,, E,,, F,,, F#,,, G,,, G#,,, A,,, A#,,, B,,, C,, C#,, ... b''''''

> multi_match(bhairav,sequence)
[1] NA
> multi_match(kaafi,sequence)
[1] NA
> multi_match(kalyan,sequence)
[1] NA
> multi_match(puriyaDhanashree,sequence)
[1] NA
> length(ans)
[1] 1
> ans= multi_match(desh,sequence)
> ans
[1] 18 20 22
> numofoccur = length(ans)
> print(numofoccur)
[1] 3
