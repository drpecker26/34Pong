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
    
    
    // Build a database of various static PongEvent data.
    let exampleponggame1 = PongEvent(eventname: "2v2 Masters Practice", eventplace: "@A-side", eventwhen: "5 days ago", eventspots: 3, eventinviter: "Sam", eventinvitees: ["Ethan","Dbo","Yang","Leimbach"])
    let exampleponggame2 = PongEvent(eventname: "Hitting around", eventplace: "@C-side", eventwhen: "3 days ago", eventspots: 3, eventinviter: "Sam", eventinvitees: ["Ethan","Dbo","Vallacher"])
    let exampleponggame3 = PongEvent(eventname: "1v1 tourny", eventplace: "@B-side", eventwhen: "10 days ago", eventspots: 1, eventinviter: "Ethan", eventinvitees: ["Sam"])
    let exampleponggame4 = PongEvent(eventname: "1v1 practice", eventplace: "@Q-side", eventwhen: "1 days ago", eventspots: 1, eventinviter: "Ethan", eventinvitees: ["Sam","Dbo","Vallacher","Yang"])
    let exampleponggame5 = PongEvent(eventname: "Harbor", eventplace: "@Basement", eventwhen: "2 days ago", eventspots: 7, eventinviter: "Dbo", eventinvitees: ["Sam","Dbo","Vallacher","Yang","Leimbach","Ethan","Bitches"])
    
    //make a table of every event in the database. Note that this has to be a computed property, rather than a 'let' or 'var'.
    var alleventtable: [PongEvent] {
        get {return [exampleponggame1,exampleponggame2,exampleponggame3,exampleponggame4,exampleponggame5]}
    }
    
    //Now make a table of events just by a person. (tested and verified in Playground)
    func yourevents(inviter: String, table: [PongEvent]) -> [PongEvent] {  //input: inviter sting; output: array of PongEvents.
        var youreventtable: [PongEvent] = []
        for i in table {    // Cycle through all events.
            // If the event is by the user, add it to "yourevents".
            if i.eventinviter == inviter {
                youreventtable.append(i)
            }
        }
        return youreventtable
    }
    
    // Use your new function to create a table just for "Sam".
    var sameventtable: [PongEvent] {
        get {return yourevents("Sam",table: alleventtable)}
    }
    
    
// UI Stuff
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
        return sameventtable.count // return length of your table.
    }
    
    // The other. This method called for every row in the table view. Returns the view representing the row (a subclass of UITableViewCell).
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // "create a table view cell with a default style – UITableViewCellStyle.Value2"
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: nil)
        
        //4/4: try to get cells to show different values.
        let rowno: Int = indexPath.row
        let event = sameventtable[rowno]
        
        // Set values for properties in UITableViewCell.
        cell.textLabel?.text = "\(event.eventname)"
        cell.detailTextLabel?.text = event.eventplace + " " + event.eventwhen
        return cell
    }
}

