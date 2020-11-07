//
//  SelectorBaseViewController.swift
//  The Domino Effect
//
//  Created by Adam McFry on 9/23/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import UIKit

class SelectorBaseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var headDominoField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backSelect(_ sender: UIButton) {
        SoundManager.shared.playSound(effect: .select)
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
    @IBAction func unwindToSelectorBase(sender: UIStoryboardSegue){
    }
    @IBOutlet weak var selectCollectionView: UICollectionView!
    
    var groupSelect = 4
    let pickerNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @objc func buttonClicked(_ sender: UIButton){
        SoundManager.shared.playSound(effect: .select)
        switch sender.tag {
            case 1:
                groupSelect = 1
            case 2:
                groupSelect = 2
            case 3:
                groupSelect = 3
            case 4:
                groupSelect = 4
            case 5:
                groupSelect = 5
            case 6:
                groupSelect = 6
            case 7:
                groupSelect = 7
            case 8:
                groupSelect = 8
            case 9:
                groupSelect = 9
            case 10:
                groupSelect = 0
            default:
                print("default")
        }
        moveToIndividualSelect()
    }

    func moveToIndividualSelect() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
           self.performSegue(withIdentifier: "toNumberView", sender: self)
        })
    }
    

    func setHeadDominoPicker() {
        
        // set up the PickerView and set the delegate
        let thePicker = UIPickerView()
        thePicker.delegate = self
        headDominoField.inputView = thePicker
        
        // toolbar to allow user to say they are done selecting a head domino
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        headDominoField.inputAccessoryView = toolBar
        
        //customize domino field
        headDominoField.layer.borderWidth = 1
        headDominoField.layer.borderColor = UIColor.white.cgColor
    }
    
    @objc func action() {
          view.endEditing(true)
    }
    
    @IBAction func moveToSort(_ sender: UIButton) {
        SoundManager.shared.playSound(effect: .select)
        groupSelect = 11
        let filterResult = DominoManager.shared.filterDominos(dominos:DominoManager.shared.dominos)
        if filterResult.count >= 2 && DominoManager.shared.leadDomino != -1{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
               self.performSegue(withIdentifier: "moveToSortSegue", sender: self)
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
    
    override func viewDidLoad() {
        // set view controller as datasource and delegate of collectionView
        selectCollectionView.dataSource = self
        selectCollectionView.delegate = self
        setHeadDominoPicker()
    }
    
    
    // MARK: - Collection View Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DominoManager.shared.menuDominos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //get a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dominoButtonCell", for: indexPath) as! SelectCollectionViewCell
        // configure it
        if indexPath.row + 1 == 10{
            cell.setCellTag(tag:0)
        } else{
            cell.setCellTag(tag:indexPath.row+1)
        }
        
        cell.setCellImage(imgName: DominoManager.shared.menuDominos[indexPath.row])
        cell.dominoButton.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        // return it
        return cell

    }


    // MARK: - Picker View Deleate Methods

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerNumbers.count
    }
        
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerNumbers[row])
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        headDominoField.text = String(pickerNumbers[row])
        DominoManager.shared.leadDomino = pickerNumbers[row]
    }
}
