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
    var menuDominos:[String] = ["Red Dominos Non-Glow Set-01",
                                "Orange Dominos Non-Glow Set-02",
                                "Yellow Dominos Non-Glow Set-03",
                                "Lime Green Dominos Non-Glow Set-04",
                                "Forest Green Dominos Non-Glow Set-05",
                                "Aqua Dominos Non-Glow Set-06",
                                "Royal Blue Dominos Non-Glow Set-07",
                                "Purple Dominos Non-Glow Set-08",
                                "Pink Dominos Non-Glow Set-09",
                                "White Dominos Non-Glow Set-00"]
        
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
    
    func sortDominos(dominos:[Domino]) -> [Domino]{
        
        
        
        return dominosSorted
    }
    
    func resetDominos() {
        //empty the arrays and make a fresh set of dominos
        self.dominos = [[]]
        self.dominosFiltered = []
        self.dominosSorted = []
        self.initializeDominos()
    }
    
    //Initializer access level change now
    private init(){}
    
    
}
