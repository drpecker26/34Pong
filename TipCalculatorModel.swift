//
//  TipCalculatorModel.swift
//  Tip Calculator model
//
//  Created by Sam Peck on 4/4/15.
//  Copyright (c) 2015 PeckLubka. All rights reserved.
//

import Foundation

// Let's try switching out the TipCalculatorModel with my basic PongEvent.

/*
class TipCalculatorModel {
    
    // establish the data types of the relevant variables.
    var total: Double
    var taxPct: Double
    //let subtotal: Double
    //Gotta do something else- make it a "Computer Property"!
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    // initialize the class (if called with 'total' and 'taxPct').
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
        //subtotal = total / (taxPct + 1) //no longer needed!
    }
    
    // 4. "->" defines the type of the output.
    
    //func calcTipWithTipPct(tipPct: Double) -> Double {
    //    return subtotal * tipPct
    //}
    
    //Let's use tuples instead of one double.
    func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double) {
        let tipAmt = subtotal * tipPct
        let finalTotal = total + tipAmt
        return (tipAmt, finalTotal)
    }
    
    // - lets return an array instead. [Int: Double] is just a shortcut for Dictionary<Int, Double>.
    
    // I.e. these two lines are identical:
    
    //  [Int: (tipAmt:Double, total:Double)]
    //  Dictionary<Int, (tipAmt:Double, total:Double)>
    
    func returnPossibleTips() -> Dictionary<Int, (tipAmt:Double, total:Double)> {
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        // 2. Create an empty dictionary (that we'll change) with "var".
        // We used here the long way of defining an empty dictionary.
        var retval = Dictionary<Int, (tipAmt:Double, total:Double)>()
        
        // 2.5, take the %'s and make them integers.
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            // 3. Do it.
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
        
    }
}
*/

class PongEvent {
    
    // Declare information of a 34Pong event.
    var eventname: String
    var eventplace: String
    var eventwhen: String
    var eventspots: UInt8  //max integer 255.
    var eventinviter: String
    var eventinvitees: [String]
    
    // More if necessary- let's not use 'em yet.
    //var eventacceptees: [String]
    //var eventrejectees: [String]
    
    // Initialize the class.
    init(eventname: String, eventplace: String, eventwhen: String, eventspots: UInt8,eventinviter: String,eventinvitees: [String]) {
        self.eventname = eventname
        self.eventplace = eventplace
        self.eventwhen = eventwhen
        self.eventspots = eventspots
        self.eventinviter = eventinviter
        self.eventinvitees = eventinvitees
    }
    
    // Debug: announce properties of class.
    func Announce() {
        println("/(eventname)")
        println("/(eventplace)")
        println("/(eventwhen)")
        println("/(eventspots)")
        println("/(eventinviter)")
        println("/(eventinvitees)")
    }
    
}



