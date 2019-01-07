//
//  ViewController.swift
//  MultiselectionButton
//
//
//  An exercise file for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var selectionLabel: UILabel!
    @IBOutlet var dessertSelection: [UIButton]!
    
    @IBAction func didSelectDessert(_ sender: UIButton) {
        allDeselected()
        selectDessert(button: sender)
        if let selection = selectedIndex() , let text = sender.titleLabel?.text{
            selectionLabel.text = "#\(selection + 1)" + text
        } else {
            selectionLabel.text = "No Selection"
        }
    }
    func allDeselected(){
        for button in dessertSelection{
            shadowOn(button: button)
        }
    }
    
  
    func selectDessert(button:UIButton){
        shadowOff(button: button)
    }
    
    func selectedIndex()->Int?{
        return dessertSelection.index(where: {(button)-> Bool in
            button.layer.shadowRadius == 1.0
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allDeselected()

    }
    
    
    // Show a shadow as though the button is floating
    func shadowOn(button:UIButton){
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.6
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowRadius = 6.0
    }
    // Hide the shadow behind the button as if button is close to surface.
    func shadowOff(button:UIButton){
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.9
        button.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        button.layer.shadowRadius = 1.0
    }

}

