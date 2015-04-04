// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class PongEvent {
    
    // Declare information of a 34Pong event.
    var eventname: String
    var eventplace: String
    var eventwhen: String
    var eventspots: UInt8  //max integer 255.
    var eventinviter: String
    
    // More if necessary- let's not use 'em yet.
    //var eventinvitees: [String]
    //var eventacceptees: [String]
    //var eventrejectees: [String]
    
    // Initialize the class.
    init(eventname: String, eventplace: String, eventwhen: String, eventspots: UInt8,eventinviter: String) {
        self.eventname = eventname
        self.eventplace = eventplace
        self.eventwhen = eventwhen
        self.eventspots = eventspots
        self.eventinviter = eventinviter
    }

    // Debug: announce properties of class.
    func Announce() {
      println("/(eventname)")
      println("/(eventplace)")
        println("/(eventwhen)")
        println("/(eventspots)")
        println("/(eventinviter)")
    }
    
}

let exampleponggame = PongEvent(eventname: "2v2 Masters Practice", eventplace: "A-side", eventwhen: "5min", eventspots: 3, eventinviter: "Sam")
exampleponggame.Announce()

let exampleponggame1 = PongEvent(eventname: "2v2 Masters Practice", eventplace: "A-side", eventwhen: "5min", eventspots: 3, eventinviter: "Sam")
let exampleponggame2 = PongEvent(eventname: "Hitting around", eventplace: "C-side", eventwhen: "15min", eventspots: 3, eventinviter: "Ethan")
let exampleponggame3 = PongEvent(eventname: "1v1 tourny", eventplace: "B-side", eventwhen: "1hr", eventspots: 1, eventinviter: "Dbo")


//practice making an array of pongevents.
let eventtable = [exampleponggame1,exampleponggame2,exampleponggame3]

eventtable[1].eventname

















