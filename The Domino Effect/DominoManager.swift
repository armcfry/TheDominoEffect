//
//  DominoManager.swift
//  The Domino Effect
//
//  Created by Adam McFry on 9/30/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import Foundation

class DominoManager {
    
    //2D array of dominos to keep up with the selection status of each domino
    var dominos:[[Domino]] = [[]]
    var dominosFiltered:[Domino] = []
    var dominosSorted:[Domino] = []
    var menuDominos:[String] = ["Red Dominos Non-Glow Set-0",
                                "Orange Dominos Non-Glow Set-0",
                                "Yellow Dominos Non-Glow Set-0",
                                "Lime Green Dominos Non-Glow Set-0",
                                "Forest Green Dominos Non-Glow Set-0",
                                "Aqua Dominos Non-Glow Set-0",
                                "Royal Blue Dominos Non-Glow Set-0",
                                "Purple Dominos Non-Glow Set-0",
                                "Pink Dominos Non-Glow Set-0",
                                "White Dominos Non-Glow Set-0"]
    
    var leadDomino = -1
    
    // for the sort function
    var tempNumSearch:Int = 0
    var paths:[[Domino]] =  [[]]
    var returnList:[Domino] = []
    
    
    
    var testSet:[Domino] = [Domino(head: 2, tail: 3, isSelected: true, clicked: true, imageName: "Orange Dominos Non-Glow Set-03"),
                            Domino(head: 2, tail: 5, isSelected: true, clicked: true, imageName: "Orange Dominos Non-Glow Set-05"),
                            Domino(head: 9, tail: 5, isSelected: true, clicked: true, imageName: "Pink Dominos Non-Glow Set-05"),
                            Domino(head: 5, tail: 7, isSelected: true, clicked: true, imageName: "Forest Green Dominos Non-Glow Set-07"),
                            Domino(head: 8, tail: 1, isSelected: true, clicked: true, imageName: "Purple Dominos Non-Glow Set-01"),
                            Domino(head: 9, tail: 8, isSelected: true, clicked: true, imageName: "Pink Dominos Non-Glow Set-08"),
                            Domino(head: 9, tail: 3, isSelected: true, clicked: true, imageName: "Pink Dominos Non-Glow Set-03"),
                            Domino(head: 5, tail: 6, isSelected: true, clicked: true, imageName: "Forest Green Dominos Non-Glow Set-06"),
                            Domino(head: 6, tail: 4, isSelected: true, clicked: true, imageName: "Aqua Dominos Non-Glow Set-04")
                            ]
    
    
    static let shared = DominoManager()
    
    // set up all dominos; will be called on reset so the user can sort again
    func initializeDominos()
    {
        for x in 0...9 {
            var temp = [Domino]()
            for y in 0...9 {
                switch x {
                case 1:
                    temp.append(Domino(head : x,tail : y, isSelected :false, clicked :false, imageName:"Red Dominos Non-Glow Set-0" + String(y)))
                case 2:
                    temp.append(Domino(head : x,tail : y, isSelected :false, clicked :false, imageName:"Orange Dominos Non-Glow Set-0" + String(y)))
                case 3:
                    temp.append(Domino(head : x,tail : y, isSelected :false, clicked :false, imageName:"Yellow Dominos Non-Glow Set-0" + String(y)))
                case 4:
                    temp.append(Domino(head : x,tail : y, isSelected :false, clicked :false, imageName:"Lime Green Dominos Non-Glow Set-0" + String(y)))
                case 5:
                    temp.append(Domino(head : x,tail : y, isSelected :false, clicked :false, imageName:"Forest Green Dominos Non-Glow Set-0" + String(y)))
                case 6:
                    temp.append(Domino(head : x,tail : y, isSelected :false, clicked :false, imageName:"Aqua Dominos Non-Glow Set-0" + String(y)))
                case 7:
                    temp.append(Domino(head : x,tail : y, isSelected :false, clicked :false, imageName:"Royal Blue Dominos Non-Glow Set-0" + String(y)))
                case 8:
                    temp.append(Domino(head : x,tail : y, isSelected :false, clicked :false, imageName:"Purple Dominos Non-Glow Set-0" + String(y)))
                case 9:
                    temp.append(Domino(head : x,tail : y, isSelected :false, clicked :false, imageName:"Pink Dominos Non-Glow Set-0" + String(y)))
                case 0:
                    temp.append(Domino(head : x,tail : y, isSelected :false, clicked :false, imageName:"White Dominos Non-Glow Set-0" + String(y)))
                default:
                    print("default")
                }
            }
            
            if x == 0{
                dominos[0] = temp
            }
            else{
                dominos.append(temp)
            }
        }
        print(dominos)
    }
    
    // function to call when a domino is selected
    func selectDomino(head: Int, tail: Int){
        // if not selected, select
        if(dominos[head][tail].isSelected == false){
            dominos[head][tail].clicked = true
            dominos[head][tail].isSelected = true
            dominos[tail][head].isSelected = true
        }
        // if selected, deselect
        else{
            dominos[head][tail].clicked = false
            dominos[tail][head].clicked = false
            dominos[head][tail].isSelected = false
            dominos[tail][head].isSelected = false
        }
    }
    
    func filterDominos(dominos:[[Domino]]) -> [Domino]{
        
        // gather the dominos from the list of dominos and filter by only ones that are selected
        for x in 0...9 {
            for y in 0...9 {
                if self.dominos[x][y].clicked == true{
                    // avoid blank space in the array
                    if dominos.count == 0{
                        dominosFiltered[0] = dominos[x][y]
                    }
                    dominosFiltered.append(dominos[x][y])
                }
            }
        }
        print(dominosFiltered)
        return dominosFiltered
    }
    
    func getDominoSum(dominos:[Domino]) -> Int{
        var sum = 0
        for domino in dominos{
            sum += domino.head
            sum += domino.tail
        }
        return sum
    }
    
    func getMatchList(toSort:[Domino], numSearch:Int)->[Domino]{
        var matchList = [Domino]()
        for domino in toSort{
            if domino.head == numSearch || domino.tail == numSearch{
                matchList.append(domino)
            }
        }
        return matchList
    }
    
    func getCommonNumber(list:[Domino])->Int{
        var numInCommon = 0
        var temp:[Int] = []
        for domino in list{
            if !temp.contains(domino.head){
                temp.append(domino.head)
            } else {
                numInCommon = domino.head
                return numInCommon
            }
            if !temp.contains(domino.tail){
                temp.append(domino.tail)
            } else{
                numInCommon = domino.tail
                return numInCommon
            }
        }
        return numInCommon
    }
    
    
    func getDominoPaths(matchList:[Domino], tempFilterList:[Domino])->[[Domino]]{
        var tempList = tempFilterList
        for domino in matchList{
            print(domino)
            returnList.append(domino)
            // remove the current domino from consideration
            for x in tempList{
                if (x.head == domino.head && x.tail == domino.tail) || (x.head == domino.tail && x.tail == domino.head){
                    tempList = tempList.filter{($0.imageName != x.imageName)}
                }
            }
            // if the node has several children, find the number that they all have in common
            if matchList.count > 1{
                tempNumSearch = getCommonNumber(list: matchList)
            }
            
            // grab the next number to seach for
            if domino.head != tempNumSearch{
                tempNumSearch = domino.head
            } else{
                tempNumSearch = domino.tail
            }
            print(tempNumSearch)
            
            // find the child nodes
            let anotherTemp = getMatchList(toSort: tempList, numSearch: tempNumSearch)
            
            // recurse if there are more to find, end this branch if not
            if anotherTemp.count != 0 {
                getDominoPaths(matchList: anotherTemp, tempFilterList: tempList)
            }
            else{
                paths.append(returnList)
            }
            returnList.removeLast()
            tempList.append(domino)
        }
        return paths
    }
    
    func sortDominos(dominosToSort:[Domino]) -> [Domino]{
        var sums:[Int] = []
        // get sum of dominos to sort
        //let totalSum = getDominoSum(dominos: dominosToSort)
        
        // get matchList based on the filtered list that is passed in
        let matchList = getMatchList(toSort: dominosToSort, numSearch: leadDomino)
        
        if matchList.count == 0{
            return dominosSorted;
        } else {
            // find all possible paths
            var paths = getDominoPaths(matchList: matchList, tempFilterList: dominosToSort)
            paths.removeFirst()
            
            // find sum of each path
            for path in paths{
                sums.append(getDominoSum(dominos: path))
            }
            
            // find the index of the path with the smallest sum
            let leastSum:Int = sums.max()!
            let index = sums.firstIndex(of: leastSum)
            
            // set the sorted path
            dominosSorted = paths[index!]
            
            // clean up the list (make sure the tails match the heads of the next domino)
            var x = leadDomino
            let limit = dominosSorted.count - 1
            for y in 0...limit{
                if dominosSorted[y].tail == x{
                    x = dominosSorted[y].head
                    dominosSorted[y] = self.dominos[dominosSorted[y].tail][dominosSorted[y].head]
                } else {
                    x = dominosSorted[y].tail
                }
            }
        }
        // return list of dominos that are now sorted
        return dominosSorted
    }
    
    func resetDominos() {
        //empty the arrays and make a fresh set of dominos
        self.dominos = [[]]
        self.dominosFiltered = []
        self.dominosSorted = []
        self.initializeDominos()
        paths = [[]]
    }
    
    //Initializer access level change now
    private init(){}
    
    
}
