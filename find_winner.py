##=======================================================
## Nicholas Richardson (20660084)
## CS 116 Winter 2017
## Assignment 09 Question 1
##=======================================================

## find_winner(filename) Takes a filename and returns the
##  total score of the winning team in the file
## find_winner: Str -> Int
## effects: reads names and scores from filename
## examples:
## find_winner("hogwarts.txt") => 5
##  where the file reads;
##  Ravenclaw,1
##  Slytherin,1
##  Hufflepuff,-2
##  Slytherin,1
##  Ravenclaw,1
##  Hufflepuff,3
##  Gryffindor,-2
##  Slytherin,3
##
## find_winner("hogwarts2.txt") => -5
##  where the file reads;
##  Slytherin,-5
##
## find_winner("soccer.txt") => 0
##  where the files reads:
##  Canada,1
##  Canada,-1
##  USA,0

def find_winner(filename):
    file = open(filename,'r')
    line = file.readline()
    dic = {}
    while line != '':
        end = len(line)
        pointer = end - 1
        char = line[pointer]
        while char != ',':
            pointer -= 1
            char = line[pointer]
        score = line[pointer+1:]
        if score[-1] == '\n':
            score = score[:-1]
        score = int(score)
        name = line[:pointer]
        if name in dic:
            dic[name]+=score
        else:
            dic[name]=score
        line = file.readline()
    file.close()
    if dic == {}:
        return
    highest_score = list(dic.values())[0]
    for team in dic:
        if dic[team] > highest_score:
            highest_score = dic[team]
    return highest_score