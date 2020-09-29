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
        performSegue(withIdentifier: "toNumberView", sender: self)
    }
    @IBAction func moveToOne(_ sender: UIButton) {
        groupSelect = 1
        performSegue(withIdentifier: "toNumberView", sender: self)
    }
    @IBAction func moveToTwo(_ sender: UIButton) {
        groupSelect = 2
        performSegue(withIdentifier: "toNumberView", sender: self)
    }
    @IBAction func moveToThree(_ sender: UIButton) {
        groupSelect = 3
        performSegue(withIdentifier: "toNumberView", sender: self)
    }
    @IBAction func moveToFour(_ sender: UIButton) {
        groupSelect = 4
        performSegue(withIdentifier: "toNumberView", sender: self)
    }
    @IBAction func moveToFive(_ sender: UIButton) {
        groupSelect = 5
        performSegue(withIdentifier: "toNumberView", sender: self)
    }
    @IBAction func moveToSix(_ sender: UIButton) {
        groupSelect = 6
        performSegue(withIdentifier: "toNumberView", sender: self)
    }
    @IBAction func moveToSeven(_ sender: UIButton) {
        groupSelect = 7
        performSegue(withIdentifier: "toNumberView", sender: self)
    }
    @IBAction func moveToEight(_ sender: UIButton) {
        groupSelect = 8
        performSegue(withIdentifier: "toNumberView", sender: self)
    }
    @IBAction func moveToNine(_ sender: UIButton) {
        groupSelect = 9
        performSegue(withIdentifier: "toNumberView", sender: self)
    }
    
    // gather information to send to the next VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let segVC = segue.destination as! NumberMenuViewController
        
        // send the VC what domino was selected
        segVC.numberToShow = groupSelect
    }
    
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backSelect(_ sender: UIButton) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
    @IBAction func unwindToSelectorBase(sender: UIStoryboardSegue){
        
    }
    
}
