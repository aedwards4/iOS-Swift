//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var fifteenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumber: UILabel!
    
    let tips = [
        tip(str: "10%", p: 0.10),
        tip(str: "15%", p: 0.15),
        tip(str: "20%", p: 0.20)
    ]
    
    var tipSelected = 0.10
    var split = 1
    var output = "0.0"
    var billBeforeTip = 0.0
    

    @IBAction func tipChanged(_ sender: UIButton) {
        
        //Dismiss keyboard
        billTextField.endEditing(true)
        
        //Select tip and store percentage
        if sender.currentTitle == tips[0].tipString{
            tenPctButton.isSelected = true
            fifteenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
            tipSelected = Double(tips[0].tipPercent)
        }
        else if sender.currentTitle == tips[1].tipString{
            fifteenPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
            tipSelected = Double(tips[1].tipPercent)
        }
        else if sender.currentTitle == tips[2].tipString{
            twentyPctButton.isSelected = true
            fifteenPctButton.isSelected = false
            tenPctButton.isSelected = false
            
            tipSelected = Double(tips[2].tipPercent)
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        split = Int(sender.value)
        splitNumber.text = String(split)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        if bill != ""{
            billBeforeTip = Double(bill)!
            let total = billBeforeTip * (1 + tipSelected) / Double(split)
            output = String(format: "%.2f", total)
        }

        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = output
            destinationVC.tip = Int(tipSelected * 100)
            destinationVC.split = split
        }
    }
 
    
}

