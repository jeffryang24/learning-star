#!/usr/bin/env python
tableData = [['apples', 'oranges', 'cherries', 'banana'],
             ['Alice', 'Bob', 'Carol', 'David'],
             ['dogs', 'cats', 'moose', 'goose']]

widthTable = [0] * len(tableData)

def getMaxWidth():
    for i in range(len(tableData)):
        maxLen = -1
        for j in range(len(tableData[i])):
            if len(tableData[i][j]) > maxLen:
                maxLen = len(tableData[i][j])
        widthTable[i] = maxLen

def printData():
    for i in range(len(tableData[0])):
        for j in range(len(tableData)):
            print(tableData[j][i].rjust(widthTable[j]), end=' ')
        print('')

getMaxWidth()
printData()
