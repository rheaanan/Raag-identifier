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

content <- readMidi(system.file("example_files", "gulabi1.mid", package="tuneR"))
mynotes=getMidiNotes(content)
sequence<-mynotes$notename
ans = multi_match(kaafi, sequence)
ans



