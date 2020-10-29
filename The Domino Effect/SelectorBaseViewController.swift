//
//  SelectorBaseViewController.swift
//  The Domino Effect
//
//  Created by Adam McFry on 9/23/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import UIKit

class SelectorBaseViewController: UIViewController{
    
    @IBOutlet weak var group0: UIButton!
    @IBOutlet weak var group1: UIButton!
    @IBOutlet weak var group2: UIButton!
    @IBOutlet weak var group3: UIButton!
    @IBOutlet weak var group4: UIButton!
    @IBOutlet weak var group5: UIButton!
    @IBOutlet weak var group6: UIButton!
    @IBOutlet weak var group7: UIButton!
    @IBOutlet weak var group8: UIButton!
    @IBOutlet weak var group9: UIButton!
    
    var groupSelect = 4
    
    @IBAction func moveToZero(_ sender: UIButton) {
        groupSelect = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
           self.performSegue(withIdentifier: "toNumberView", sender: self)
        })
    }
    @IBAction func moveToOne(_ sender: UIButton) {
        groupSelect = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
           self.performSegue(withIdentifier: "toNumberView", sender: self)
        })
    }
    @IBAction func moveToTwo(_ sender: UIButton) {
        groupSelect = 2
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
           self.performSegue(withIdentifier: "toNumberView", sender: self)
        })
    }
    @IBAction func moveToThree(_ sender: UIButton) {
        groupSelect = 3
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
           self.performSegue(withIdentifier: "toNumberView", sender: self)
        })
    }
    @IBAction func moveToFour(_ sender: UIButton) {
        groupSelect = 4
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
           self.performSegue(withIdentifier: "toNumberView", sender: self)
        })
    }
    @IBAction func moveToFive(_ sender: UIButton) {
        groupSelect = 5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
           self.performSegue(withIdentifier: "toNumberView", sender: self)
        })
    }
    @IBAction func moveToSix(_ sender: UIButton) {
        groupSelect = 6
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
           self.performSegue(withIdentifier: "toNumberView", sender: self)
        })
    }
    @IBAction func moveToSeven(_ sender: UIButton) {
        groupSelect = 7
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
           self.performSegue(withIdentifier: "toNumberView", sender: self)
        })
    }
    @IBAction func moveToEight(_ sender: UIButton) {
        groupSelect = 8
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
           self.performSegue(withIdentifier: "toNumberView", sender: self)
        })
    }
    @IBAction func moveToNine(_ sender: UIButton) {
        groupSelect = 9
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
           self.performSegue(withIdentifier: "toNumberView", sender: self)
        })
    }
    
    @IBAction func moveToSort(_ sender: UIButton) {
        groupSelect = 11
        var filterResult = DominoManager.shared.filterDominos(dominos:DominoManager.shared.dominos)
        if filterResult.count >= 2{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
               self.performSegue(withIdentifier: "moveToSort", sender: self)
            })
        }
        else{
            return
        }
    }
    // gather information to send to the next VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.destination is NumberMenuViewController{
            let segVC = segue.destination as! NumberMenuViewController
        
            // send the VC what domino was selected
            segVC.numberToShow = groupSelect
        }
    }
    
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backSelect(_ sender: UIButton) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
    @IBAction func unwindToSelectorBase(sender: UIStoryboardSegue){
        
    }
    
}
