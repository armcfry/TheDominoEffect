//
//  ViewController.swift
//  The Domino Effect
//
//  Created by Adam McFry on 8/10/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HelpViewControllerProtocol {

    

    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func helpTap(_ sender: UIButton) {
        let button = sender as UIButton
        if button.tag == 1
        {
            helpDialogue!.titleText = "ABOUT"
            helpDialogue!.feedbackText = "The Domino Effect is an iOS application that sorts a collection of user-specified dominoes. The use case for this application will be a companion when playing a round of dominoes. Press start, then select the dominoes you wish to sort, then press sort."
            helpDialogue!.buttonText = "DISMISS";
            DispatchQueue.main.async
            {
                self.present(self.helpDialogue!, animated: true, completion: nil)
            }
        }
    }
    var helpDialogue:HelpViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initialize the result dialog
        helpDialogue = storyboard?.instantiateViewController(identifier: "HelpVC") as? HelpViewController
        helpDialogue?.modalPresentationStyle = .overCurrentContext
        helpDialogue?.delegate = self
        // Do any additional setup after loading the view.
    }


func dialogueDismissed() {
    print("dismiss");
}
}
