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
        print(dominos[7][1])
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
    
    //Initializer access level change now
    private init(){}
    
    
}
