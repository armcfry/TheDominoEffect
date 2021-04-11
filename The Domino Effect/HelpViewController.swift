//
//  HelpViewController.swift
//  The Domino Effect
//
//  Created by Adam McFry on 9/21/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import UIKit
protocol HelpViewControllerProtocol
{
    func dialogueDismissed()
}

class HelpViewController: UIViewController {
    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var dialogueView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!


    var titleText = ""
    var feedbackText = ""
    var buttonText = ""
    
    var delegate:HelpViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dialogueView.layer.cornerRadius = 25
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        // Now that the elements are loaded, set the text
        titleLabel.text = titleText
        feedbackLabel.text = feedbackText
        dismissButton.setTitle(buttonText, for: .normal)
        
        dimView.alpha = 0
        titleLabel.alpha = 0
        feedbackLabel.alpha = 0
        dismissButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
            self.dimView.alpha = 1
            self.titleLabel.alpha = 1
            self.feedbackLabel.alpha = 1
            self.dismissButton.alpha = 1

        }, completion: nil)
    }
    
    @IBAction func dismissTapped(_ sender: Any)
    {
        // fade out the dimView
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.dimView.alpha = 0
        }) { (completed) in
            self.dismiss(animated: true, completion: nil)
            // notify delegate that popup was dismissed
            self.delegate?.dialogueDismissed()
        }
        

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
