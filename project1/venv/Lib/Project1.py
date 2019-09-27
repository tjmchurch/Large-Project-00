
allWordsLowerCase = [line.strip().lower() for line in open("words.txt", 'r')]
#helper function that standardize letters to be one string
def find_words(letters):
    return findWord((''.join(letters.lower())))
#returns a list of words that are 7 lettered and contained in letters
#reads a dictoinary from words.txt
def findWord(letters):
    allWordsLowerCase = [line.strip().lower() for line in open("words.txt", 'r')]
    allWordsLowerCase = filter(lambda x: len(x) == 7, allWordsLowerCase)
    allWordsLowerCase = filter(lambda x: containedIn(x, letters), allWordsLowerCase)
    return allWordsLowerCase
#returns True is str is contained in letterStr else returns False
def containedIn(str, letterStr):
    if len(str) == 0:
        return True
    if len(letterStr) == 0:
        return False
    if str.count(str[0]) > letterStr.count(str[0]):
        return False
    return containedIn(str[1:len(str)],letterStr)
#test with no letters
print(', '.join(find_words("")))
#test with one letters
print(', '.join(find_words("zymomin")))
#test with multiple letters
print(', '.join(find_words("zymomin" "omixa")))
