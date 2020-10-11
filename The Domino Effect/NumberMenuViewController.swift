//
//  NumberMenuViewController.swift
//  The Domino Effect
//
//  Created by Adam McFry on 9/27/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import UIKit

class NumberMenuViewController: UIViewController{
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var zeroDomino: UIButton!
    
    @IBOutlet weak var oneDomino: UIButton!
    @IBOutlet weak var twoDomino: UIButton!
    @IBOutlet weak var threeDomino: UIButton!
    @IBOutlet weak var fourDomino: UIButton!
    @IBOutlet weak var fiveDomino: UIButton!
    @IBOutlet weak var sixDomino: UIButton!
    @IBOutlet weak var sevenDomino: UIButton!
    @IBOutlet weak var eightDomino: UIButton!
    @IBOutlet weak var nineDomino: UIButton!
    
    @IBOutlet var dominoCollection: Array<UIButton>!

    var numberToShow = 0
    
    // go back to the previous screen
    @IBAction func backSelect(_ sender: UIButton) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
    @IBAction func unwindToSelectorBase(sender: UIStoryboardSegue){
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        // change the outfit for the buttons
        switch numberToShow {
        case 0:
            let imgName = "Red Dominos Non-Glow Set-0"
            for button in dominoCollection{
                let thisBImage = "\(imgName)\(button.tag).png"
                button.setImage(UIImage(named: thisBImage), for: .normal)
            }
        case 1:
            let imgName = "Orange Dominos Non-Glow Set-0"
            for button in dominoCollection{
                let thisBImage = "\(imgName)\(button.tag).png"
                button.setImage(UIImage(named: "Orange.png"), for: .normal)
            }
        case 2:
            let imgName = "Yellow Dominos Non-Glow Set-0"
            for button in dominoCollection{
                let thisBImage = "\(imgName)\(button.tag).png"
                button.setImage(UIImage(named: thisBImage), for: .normal)
            }
        case 3:
            let imgName = "Lime Green Dominos Non-Glow Set-0"
            for button in dominoCollection{
                let thisBImage = "\(imgName)\(button.tag).png"
                button.setImage(UIImage(named: thisBImage), for: .normal)
            }
        case 4:
            let imgName = "Forest Green Dominoes Non-Glow Set-0"
            for button in dominoCollection{
                let thisBImage = "\(imgName)\(button.tag).png"
                button.setImage(UIImage(named: thisBImage), for: .normal)
            }
        case 5:
            let imgName = "Aqua Dominoes Non-Glow Set-0"
            for button in dominoCollection{
                let thisBImage = "\(imgName)\(button.tag).png"
                button.setImage(UIImage(named: thisBImage), for: .normal)
            }
        case 6:
            let imgName = "Royal Blue Dominoes Non-Glow Set-0"
            for button in dominoCollection{
                let thisBImage = "\(imgName)\(button.tag).png"
                button.setImage(UIImage(named: thisBImage), for: .normal)
            }
        case 7:
            let imgName = "Purple Dominoes Non-Glow Set-0"
            for button in dominoCollection{
                let thisBImage = "\(imgName)\(button.tag).png"
                button.setImage(UIImage(named: thisBImage), for: .normal)
            }
        case 8:
            let imgName = "Pink Dominoes Non-Glow Set-0"
            for button in dominoCollection{
                let thisBImage = "\(imgName)\(button.tag).png"
                button.setImage(UIImage(named: thisBImage), for: .normal)
            }
        case 9:
            let imgName = "White Dominoes Non-Glow Set-0"
            for button in dominoCollection{
                let thisBImage = "\(imgName)\(button.tag).png"
                button.setImage(UIImage(named: thisBImage), for: .normal)
            }
        default:
            print("default")
        }
    }
    
}
