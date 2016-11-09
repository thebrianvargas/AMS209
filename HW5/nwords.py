"""
Brian Vargas (bvargas6@ucsc.edu)
AMS209 Foundations of Scientific Computing
Homework #5 - Problem #1
nwords.py
"""
def nwordsList(N=False,printBool=True):
    """
    Reads the first N many words from the file words.txt and builds a
    list with one element per word

    Inputs:
        * N         integer identifying the number of words to read

    Outputs:
        * outList   list containing the first N words of words.txt
    """
    #open words.txt - continuing on if it is in the current working directory
    fn = open("words.txt","r")
    if not fn:
        print "ERROR - words.txt not in current working directory"
        return

    #initialize our output list
    outList = list()
    
    count = 0
    for line in fn:
        #remove the newlines and blank spaces - extract the words
        word = line.strip()
        #append the word to our list
        outList.append(word)

        #if a particular N (not ALL) was provided
        if N:
            #everytime we successfully get a new line, add 1 to our count
            count += 1
            #break once we are done adding the Nth word
            if count == N:
                break

    #close file and output list once we are finished reading
    fn.close()
    if printBool:
        print outList
    return outList

def nwordsDict(N=False, printBool=True):
    """
    Reads the first N many words from the file words.txt and builds a
    dictionary with the words as the keys and their frequency as the values

    Inputs:
        * N         integer identifying the number of words to read

    Outputs:
        * outDict   dictionary containing the first N words of words.txt as keys
                    with their frequency as the corresponding values
    """
    #open words.txt - continuing on if it is in the current working directory
    fn = open("words.txt","r")
    if not fn:
        print "ERROR - words.txt is not in the current working directory"
        return

    #initialize our output dictionary
    outDict = dict()

    count = 0
    for line in fn:
        #remove the newlines and blank spaces - extract the words
        word = line.strip()
        #update frequency to this word
        if word in outDict:
            outDict[word] += 1
        else:
            outDict[word] = 1

        #if a particular N (not ALL) was provided
        if N:
            #everytime we successfully get a new line, add 1 to our count
            count += 1
            #break once we are done adding the Nth word
            if count == N:
                break
        
    #close file and output dictionary once we are finished reading
    fn.close()
    if printBool:
        print outDict
    return outDict

if __name__ == "__main__":
    N = raw_input("Read the first N words: ")
    if N == "ALL": 
	#prints both list and dict to show my code works
        nwordsList()
        nwordsDict()
    else:
        N = int(N)
        nwordsList(N)
        nwordsDict(N)






