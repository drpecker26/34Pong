//
//  ViewController.swift
//  34Pong
//
//  Created by Sam Peck on 4/4/15, modified from the tutorial files.
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
    @IBOutlet var eventtableheader : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    
    
    // 4/4: removing TipCalc stuff, replacing w/ PongEvent.
    let exampleponggame1 = PongEvent(eventname: "2v2 Masters Practice", eventplace: "@A-side", eventwhen: "5 days ago", eventspots: 3, eventinviter: "Sam")
    let exampleponggame2 = PongEvent(eventname: "Hitting around", eventplace: "@C-side", eventwhen: "3 days ago", eventspots: 3, eventinviter: "Ethan")
    let exampleponggame3 = PongEvent(eventname: "1v1 tourny", eventplace: "@B-side", eventwhen: "10 days ago", eventspots: 1, eventinviter: "Dbo")
    
    //make a table. Note that this has to be a computed property, rather than a 'let' or 'var'.
    var eventtable: [PongEvent] {
        get {
            return [exampleponggame1,exampleponggame2,exampleponggame3]
        }
    }
    
    // Not sure what this does. I think it connects the script to the Table View.
    @IBOutlet weak var tableView: UITableView!
    
    // This thing refreshes the screen.
    func refreshUI() {
        totalTextField.text = String(exampleponggame1.eventname)
        eventtableheader.text = "Your past events"
    }
    
    override func viewDidLoad() {  //Refresh that shit! Legacy code from Tipcalc.
        super.viewDidLoad()
        refreshUI()
    }
    
    override func didReceiveMemoryWarning() {  //Legacy code from Tipcalc. Not sure what it does.
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func viewTapped(sender : AnyObject) { //Legacy code. Dismisses the keyboard.
        totalTextField.resignFirstResponder()
    }

    
// 3/31: "one of the two required methods you must implement to conform to UITableViewDataSource". Asks how many rows there are in the table.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 // USed to be 'sortedKeys.count'. For now, hardcode rows.
    }
    
    // The other. This method called for every row in the table view. Returns the view representing the row (a subclass of UITableViewCell).
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // "create a table view cell with a default style – UITableViewCellStyle.Value2"
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: nil)
        
        //4/4: try to get cells to show different values.
        let rowno: Int = indexPath.row
        let event = eventtable[rowno]
        
        // Set values for properties in UITableViewCell.
        cell.textLabel?.text = "\(event.eventname)"
        cell.detailTextLabel?.text = event.eventplace + " " + event.eventwhen
        return cell
    }
}

