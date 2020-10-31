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
    
    @IBAction func selectDomino(sender: UIButton) {

        DominoManager.shared.selectDomino(head: numberToShow, tail: sender.tag)
        if DominoManager.shared.dominos[numberToShow][sender.tag].isSelected == true {
            sender.layer.opacity -= 0.5;
        }
        else{
            sender.layer.opacity += 0.5;
        }
        print(DominoManager.shared.dominos)
    }
    
    func setButtons (imageName: String){
        for button in dominoCollection{
            let thisBImage = "\(imageName)\(button.tag).png"
            button.setImage(UIImage(named: thisBImage), for: .normal)
            if DominoManager.shared.dominos[numberToShow][button.tag].isSelected == true {
                button.layer.opacity = 0.5
            }
            else{
                button.layer.opacity = 1
            }
        }
    }
    
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
        case 1:
            setButtons(imageName: "Red Dominos Non-Glow Set-0")
        case 2:
            setButtons(imageName: "Orange Dominos Non-Glow Set-0")
        case 3:
            setButtons(imageName: "Yellow Dominos Non-Glow Set-0")
        case 4:
            setButtons(imageName: "Lime Green Dominos Non-Glow Set-0")
        case 5:
            setButtons(imageName: "Forest Green Dominos Non-Glow Set-0")
        case 6:
            setButtons(imageName: "Aqua Dominos Non-Glow Set-0")
        case 7:
            setButtons(imageName: "Royal Blue Dominos Non-Glow Set-0")
        case 8:
            setButtons(imageName: "Purple Dominos Non-Glow Set-0")
        case 9:
            setButtons(imageName: "Pink Dominos Non-Glow Set-0")
        case 0:
            setButtons(imageName: "White Dominos Non-Glow Set-0")
        default:
            print("default")
        }
    }
    
}
