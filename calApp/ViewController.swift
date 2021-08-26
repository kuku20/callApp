//
//  ViewController.swift
//  calApp
//
//  Created by Luu, Loc on 8/26/21.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var billAmountTextField: UITextField!

    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSliderControl: UISlider!
    @IBOutlet weak var tipSlider: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipSliderControl.value = 50
        tipSliderControl.minimumValue = 0
        tipSliderControl.maximumValue = 100
       // tipSlider.text = String(format:"Tip",Int(tipSliderControl.value))
       
        
        

    }

    @IBAction func numpad(_ sender: UITextField) {
        billAmountTextField.keyboardType = .numberPad
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18 ,0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f",tip)
        //Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    

    @IBAction func tipSlider(_ sender: UISlider) {

        let currentValue = Double(sender.value)
        //tipSlider.text = String(format:"Tip: ",currentValue)
        tipSlider.text = String(format: "Tip %.2f%%",currentValue)
        
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercent = currentValue/100
        // Get Total tip by multiplying tip * tipPercentage
        
        let tip = tipPercent * bill
        let total = bill + tip
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f",tip)
        //Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }

}

