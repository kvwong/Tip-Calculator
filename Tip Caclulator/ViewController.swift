//
//  ViewController.swift
//  Tip Caclulator
//
//  Created by Kevin Wong on 8/13/15.
//  Copyright (c) 2015 Kevin Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        peopleLabel.text = "1 Person"
        //billField.text = "$0.00"
        self.billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
        var people = Int(sender.value).description
        if people == "1" {
            peopleLabel.text = "\(people) Person"
        } else {
            peopleLabel.text = "\(people) People"
        }
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.00, 0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipSegment.selectedSegmentIndex]
        var split = peopleStepper.value
        println(split)
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = (billAmount + tip) / split
    
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        //billField.text = "$\(billAmount)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        //billField.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }


}

