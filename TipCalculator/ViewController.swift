//
//  ViewController.swift
//  TipCalculator
//
//  Created by Daniel Ku on 12/10/16.
//  Copyright © 2016 djku. All rights reserved.
//

import UIKit

var tipSelectorType = "Default"
var roundTotalFlag = false
var splitDefaultValue = "1"

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var splitCountField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var customTipField: UITextField!
    @IBOutlet weak var tipType1StackView: UIStackView!
    @IBOutlet weak var tipType2StackView: UIStackView!
    @IBOutlet weak var tipperNavItem: UINavigationItem!
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        //Save in NSData so user has values still in the textfields
        if let type = defaults.string(forKey: "tipSelectorType"){
            tipSelectorType = type
        }
        if let split = defaults.string(forKey: "splitDefaultValue"){
            splitDefaultValue = split
        }
        roundTotalFlag = defaults.bool(forKey: "roundTotalFlag")
        
        if let billAmount = defaults.string(forKey: "billAmount"){
            billAmountTextField.text = billAmount
        }
        
        //Keyboard dismiss functionality
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        //Button styling
        calcButton.layer.borderWidth = 0
        calcButton.layer.masksToBounds = false
        calcButton.layer.cornerRadius = calcButton.frame.height/6
        calcButton.clipsToBounds = true
        
        tipperNavItem.hidesBackButton = true
        
        splitCountField.text! = splitDefaultValue
        
        if tipSelectorType == "Default"{
            tipType2StackView.isHidden = true
            tipType1StackView.isHidden = false
        }
        else{
            tipType2StackView.isHidden = false
            tipType1StackView.isHidden = true
            if let customTip = defaults.string(forKey: "customTip"){
                customTipField.text = customTip
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    //Tip calculating button that contains all the math and functionality of the app
    @IBAction func calculateTip(_ sender: AnyObject) {
        guard let billAmount = Double(billAmountTextField.text!) else{
            let alertController = UIAlertController(title: "You didn't enter a bill amount!", message: "", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: .default){ (action) in
            }

            alertController.addAction(closeAction)
            
            self.present(alertController, animated: true){
            }
            
            billAmountTextField.text = ""
            tipAmountLabel.text = ""
            totalAmountLabel.text = ""
            
            return
        }
        //Tip
        var tipPercent = 0.0
        if tipSelectorType == "Custom"{
            guard let customTip = Double(customTipField.text!) else{
                let alertController = UIAlertController(title: "You didn't enter a tip amount!", message: "", preferredStyle: .alert)
                let closeAction = UIAlertAction(title: "Close", style: .default){ (action) in
                }
                alertController.addAction(closeAction)
                
                self.present(alertController, animated: true){
                }
                
                return
            }
            tipPercent = customTip/100
            
            defaults.set(customTip, forKey: "customTip")
            defaults.synchronize()
        }else{
            switch tipSelector.selectedSegmentIndex{
            case 0:
                tipPercent = 0.15
            case 1:
                tipPercent = 0.18
            case 2:
                tipPercent = 0.20
            default:
                break
            }
        }
    
        //Math for tip calculations
        let roundedBillAmount = round(billAmount * 100) / 100
        let tipAmount = roundedBillAmount * tipPercent
        let roundedTipAmount = round(tipAmount * 100) / 100
        var totalAmount = roundedBillAmount + roundedTipAmount
        
        let splitCount:Double? = Double(splitCountField.text!)
        let splitAmount = totalAmount/splitCount!
        
        if roundTotalFlag == true{
            totalAmount = round(totalAmount)
        }
        
        if(!billAmountTextField.isEditing){
            billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
        }
        
        defaults.set(roundedBillAmount, forKey: "billAmount")
        defaults.synchronize()
        
        perPersonLabel.text = String(format: "$%.2f", splitAmount)
        tipAmountLabel.text = String(format: "$%.2f", roundedTipAmount)
        totalAmountLabel.text = String(format: "$%.2f", totalAmount)
        
        self.view.endEditing(true)
    }

}

