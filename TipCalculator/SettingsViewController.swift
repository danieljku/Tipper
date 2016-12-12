//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Daniel Ku on 12/10/16.
//  Copyright © 2016 djku. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipType: UISegmentedControl!
    @IBOutlet weak var splitDefault: UITextField!
    @IBOutlet weak var saveSettingsButton: UIButton!
    @IBOutlet weak var roundTotalAmount: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if let type = defaults.string(forKey: "tipSelectorType"){
            tipSelectorType = type
        }
        if let split = defaults.string(forKey: "splitDefaultValue"){
            splitDefaultValue = split
        }
        roundTotalFlag = defaults.bool(forKey: "roundTotalFlag")
        
        
        saveSettingsButton.layer.borderWidth = 0
        saveSettingsButton.layer.masksToBounds = false
        saveSettingsButton.layer.cornerRadius = saveSettingsButton.frame.height/6
        saveSettingsButton.clipsToBounds = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.navigationItem.backBarButtonItem?.title = "Back"

        if roundTotalFlag == true{
            roundTotalAmount.selectedSegmentIndex = 0
        }else{
            roundTotalAmount.selectedSegmentIndex = 1
        }
        
        if tipSelectorType == "Default"{
            tipType.selectedSegmentIndex = 0
        }else{
            tipType.selectedSegmentIndex = 1
        }
        
        splitDefault.text = splitDefaultValue
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    

    @IBAction func saveSettings(_ sender: AnyObject) {
        splitDefaultValue = splitDefault.text!
        
        if tipType.selectedSegmentIndex == 0{
            tipSelectorType = "Default"
        }else{
            tipSelectorType = "Custom"
        }
        
        if roundTotalAmount.selectedSegmentIndex == 0{
            roundTotalFlag = true
        }else{
            roundTotalFlag = false
        }
        
        let defaults = UserDefaults.standard
        defaults.set(tipSelectorType, forKey: "tipSelectorType")
        defaults.set(splitDefaultValue, forKey: "splitDefaultValue")
        defaults.set(roundTotalFlag, forKey: "roundTotalFlag")
        defaults.synchronize()
        
        self.view.endEditing(true)

    }
}
