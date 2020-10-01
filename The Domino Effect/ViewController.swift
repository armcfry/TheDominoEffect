//
//  ViewController.swift
//  The Domino Effect
//
//  Created by Adam McFry on 8/10/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HelpViewControllerProtocol {

    // variables
    let player = SoundManager()
    var music = false
    var helpDialogue:HelpViewController?
    var numStartTap = 0

    // IBOutlet Variables
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func startTap(_ sender: UIButton) {
        player.playSound(effect: .select)
        if numStartTap == 0{
            DominoManager.shared.initializeDominos()
        }
        numStartTap += 1
        performSegue(withIdentifier: "selectionBase", sender: self)
    }
    
    @IBAction func unwindToMainMenu(sender: UIStoryboardSegue){
        
    }
    
    // IBOutlet Functions
    @IBAction func helpTap(_ sender: UIButton) {
        //let button = sender as UIButton
        player.playSound(effect: .select)
        helpDialogue!.titleText = "ABOUT"
        helpDialogue!.feedbackText = "The Domino Effect is an iOS application that sorts a collection of user-specified dominoes. The use case for this application will be a companion when playing a round of dominoes. Press start, then select the dominoes you wish to sort, then press sort."
        helpDialogue!.buttonText = "DISMISS";
        DispatchQueue.main.async
        {
            self.present(self.helpDialogue!, animated: true, completion: nil)
        }
    }
    
    @IBAction func settingsTap(_ sender: UIButton) {
        player.playSound(effect: .select)
    }
    
    @IBAction func soundTap(_ sender: UIButton) {
        player.playSound(effect: .select)
        if music == true{
            player.removeVolume()
            soundButton.setImage(UIImage(named: "soundOff.png"), for: .normal)
            music = false
        }
        else{
            player.addVolume()
            soundButton.setImage(UIImage(named: "sound.png"), for: .normal)
            music = true
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // background music for the main menu
        player.playSound(effect: .mainMenu)
        music = true
        
        
        //Initialize the help dialog
        helpDialogue = storyboard?.instantiateViewController(identifier: "HelpVC") as? HelpViewController
        helpDialogue?.modalPresentationStyle = .overCurrentContext
        helpDialogue?.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

func dialogueDismissed() {
    print("dismiss");
}
}
