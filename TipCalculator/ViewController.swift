//
//  ViewController.swift
//  TipCalculator
//
//  Created by Sam Peck on 3/28/15.
//  Copyright (c) 2015 Sam Peck. All rights reserved.
//  test change/ 

import UIKit

class UIViewController {
}

// 3/31: Conform Viewcontroller to UITableViewDataSource.
class ViewController: UIKit.UIViewController, UITableViewDataSource {
    // Declare 4 variables.
    //@IBOutlet is to let Xcode's interface builder find these variables to connect to in the interface.
    // "!" does something else that I don't get. 
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    
    
    // Ok - let's connect the Model!
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)  //looks like instantiating it just any old way.
    @IBOutlet weak var tableView: UITableView!
    //3/31: Add these guys.
    var possibleTips = Dictionary<Int, (tipAmt:Double, total:Double)>()
    var sortedKeys:[Int] = []
    
    
    // This thing refreshes the screen.
    func refreshUI() {
        // 1 Converting from one data type to another.
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        // 2 Show tax pct as an integer, not a decimal.
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        // 3 Updates the label next to the slider.
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        /*// 4 Clear the results until the user hits the 'calculate' button.
        resultsTextView.text = "" */ //eliminated 3/31
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI() //Refresh that shit!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // More methods! Not sure what they do yet. Actions instead of Outlets.
//**    // All have (sender : AnyObject). Why??
/*
    @IBAction func calculateTapped(sender : AnyObject) {
        // 1  Convert a string to a double.
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        // 2 Calculate the possible tips.
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        // 3 Enumerate though both keys and entries in the dictionary.
        for (tipPct, tipValue) in possibleTips {
            // 4 Make a results variable.
            results += "\(tipPct)%: \(tipValue)\n"
        }
*/
        // 3/31: New function.
        @IBAction func calculateTapped(sender : AnyObject) {
            tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
            possibleTips = tipCalc.returnPossibleTips()
            sortedKeys = sorted(Array(possibleTips.keys))
            tableView.reloadData()
        }
      /*
        // New fancy way of sorting by tip.
        var keys = Array(possibleTips.keys)
        sort(&keys)
        for tipPct in keys {
            let tipValue = possibleTips[tipPct]!
            let prettyTipValue = String(format:"%.2f", tipValue)
            results += "\(tipPct)%: $\(prettyTipValue)\n"
        }

        // 5 Show it!
        resultsTextView.text = results
     */
    
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        //Yo, did the tax pct change?
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0  //put the new tax pct into the model.
        refreshUI()

        
    }
    @IBAction func viewTapped(sender : AnyObject) {
        totalTextField.resignFirstResponder()  //Dismiss the keyboard.
    }


//3/31:  Copy over Table View Methods
       // "one of the two required methods you must implement to conform to UITableViewDataSource". Asks how many rows there are in the table.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedKeys.count
    }
    
    // The other:
    // 1. This method called for every row in the table view. Returns the view representing the row (a subclass of UITableViewCell).
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 2 "create a table view cell with a default style – UITableViewCellStyle.Value2"
        let cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        
        // 3 Just one section in the table; this shows the row index.
        let tipPct = sortedKeys[indexPath.row]
        // 4  Pull from the dictionary the tip amount and total tuples. Normally this pulls optional values (if the key doesn't exist) but we know it does so we force-unwrap with "!".
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        // 5 Set values for properties in UITableViewCell.
        cell.textLabel?.text = "\(tipPct)%:"
        cell.detailTextLabel?.text = String(format:"Tip: $%0.2f, Total: $%0.2f", tipAmt, total)
        return cell
    }
}

