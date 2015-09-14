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
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var tipText: UILabel!
    @IBOutlet weak var darkView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        peopleLabel.text = "1 Person"
        //billField.text = "$0.00"
        
        tipText.alpha = 0
        totalText.alpha = 0
        tipLabel.alpha = 0
        totalLabel.alpha = 0
        peopleLabel.alpha = 0
        tipSegment.alpha = 0
        peopleStepper.alpha = 0
        darkView.alpha = 0
        
        billField.frame = CGRectMake(0,0,100,100)
        //billField.frame.origin.y += 100
        
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
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = (billAmount + tip) / split
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        //billField.text = "$\(billAmount)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        //billField.text = String(format: "$%.2f", total)
        
        let duration = 0.4
        let delay = 0.1
        let options = UIViewAnimationOptions.CurveEaseInOut
        
        //CGRect newFrame = billField.frame
        
        if billAmount > 0 {
            UIView.animateWithDuration(duration, delay: 0.2, options: options, animations: {
                //self.billField.frame.origin.y += 10
                self.tipText.alpha = 1
                self.totalText.alpha = 1
                self.tipLabel.alpha = 1
                self.totalLabel.alpha = 1
                self.darkView.alpha = 1
                }, completion: nil)
                
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                self.peopleLabel.alpha = 1
                self.tipSegment.alpha = 1
                self.peopleStepper.alpha = 1
                
                }, completion: nil)
        } else {
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                //self.billField.frame.origin.y -= 100
                self.tipText.alpha = 0
                self.totalText.alpha = 0
                self.tipLabel.alpha = 0
                self.totalLabel.alpha = 0
                self.peopleLabel.alpha = 0
                self.tipSegment.alpha = 0
                self.peopleStepper.alpha = 0
                self.darkView.alpha = 0
                }, completion: nil)

        }
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }

    @IBAction func resetButton(sender: AnyObject) {
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        peopleLabel.text = "1 Person"
        peopleStepper.value = 1
        tipSegment.selectedSegmentIndex = 0
        
    }

}

