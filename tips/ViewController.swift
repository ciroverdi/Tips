//
//  ViewController.swift
//  tips
//
//  Created by Ciro Verdi on 10/2/15.
//  Copyright © 2015 walmart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var tipTitleLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalTitleLabel1: UILabel!
    @IBOutlet weak var totalLabel1: UILabel!
    @IBOutlet weak var totalTitleLabel2: UILabel!
    @IBOutlet weak var totalLabel2: UILabel!
    @IBOutlet weak var totalTitleLabel3: UILabel!
    @IBOutlet weak var totalLabel3: UILabel!
    @IBOutlet weak var totalTitleLabel4: UILabel!
    @IBOutlet weak var totalLabel4: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var billField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel1.text = "$0.00"
        totalLabel2.text = "$0.00"
        totalLabel3.text = "$0.00"
        totalLabel4.text = "$0.00"
        
        billField.becomeFirstResponder()
        
        hideLabels(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChange(sender: AnyObject) {
        var tipPercentages = [0.18, 0.20, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total1 = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel1.text = String(format: "$%.2f", total1)
        totalLabel2.text = String(format: "$%.2f", total1 / 2)
        totalLabel3.text = String(format: "$%.2f", total1 / 3)
        totalLabel4.text = String(format: "$%.2f", total1 / 4)
        
        if billAmount > 0 {
            hideLabels(false)
        } else {
            hideLabels(true)
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func hideLabels(hide: Bool){
        billAmountLabel.hidden = hide
        tipTitleLabel.hidden = hide
        tipLabel.hidden = hide
        lineView.hidden = hide
        tipControl.hidden = hide
        totalTitleLabel1.hidden = hide
        totalLabel1.hidden = hide
        totalTitleLabel2.hidden = hide
        totalLabel2.hidden = hide
        totalTitleLabel3.hidden = hide
        totalLabel3.hidden = hide
        totalTitleLabel4.hidden = hide
        totalLabel4.hidden = hide
    }
    
}

