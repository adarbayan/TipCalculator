//
//  ViewController.swift
//  Tipsy
//
//  Created by Adar Bayan on 16.12.2021.
// 
//

import UIKit

class CalculatorViewController: UIViewController {
    //Main Screen IBOutlet variables
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    //Default Values
    var tip = 0.10
    var bill = 0.0
    var totalBill = 0.0
    var splittedBill = 0.0
    var numberOfPeopleInSplit = 2
    
    //This function prints the calculated bill after user enters the values of bill, tip percentage,and the number of people that are going to split the total bill..
    @IBAction func calculatePressed(_ sender: UIButton) {
    
        totalBill = bill + (bill*tip)
        splittedBill = totalBill/Double(numberOfPeopleInSplit)
        
        print(splittedBill)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    //This function is  created for the transition between the main screen and the ResultViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = String(format: "%f",splittedBill)
            destinationVC.tip = tip
            destinationVC.split = numberOfPeopleInSplit
            
            
        }
    }
    //This function is for the changing the stepper Value (number of people that are going to split for the total bill)
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
        numberOfPeopleInSplit = (Int(sender.value))
       
    }
    //This function is used for selecting the tip and deselect the other tips.
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
            
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
                
          
        tip = buttonTitleAsANumber / 100
        let billTotal = Double(billTextField.text!) ?? 0.0
        bill = billTotal
        
    }
    
}

