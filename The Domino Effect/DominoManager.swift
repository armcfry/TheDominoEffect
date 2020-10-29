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
        
    static let shared = DominoManager()
    
    // set up all dominos; will be called on reset so the user can sort again
    func initializeDominos()
    {
        for x in 0...9 {
            var temp = [Domino]()
            for y in 0...9 {
                temp.append(Domino(head : x,tail : y, isSelected :false, imageName:""))
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
            dominos[head][tail].isSelected = true
            dominos[tail][head].isSelected = true
        }
        // if selected, deselect
        else{
            dominos[head][tail].isSelected = false
            dominos[tail][head].isSelected = false
        }
    }
    
    func filterDominos(dominos:[[Domino]]) -> [Domino]{
        var dominosFiltered:[Domino] = []
        
        // gather the dominos from the list of dominos and filter by only ones that are selected
        for x in 0...9 {
            for y in 0...9 {
                if self.dominos[x][y].isSelected == true{
                    // remove duplicates
                    self.dominos[y][x].isSelected = false
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
        var dominosSorted:[Domino] = []
        
        
        
        return dominosSorted
    }
    
    //Initializer access level change now
    private init(){}
    
    
}
