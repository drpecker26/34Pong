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
    var eventinvitees: [String]
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


//practice making an array of pongevents.
let exampleponggame1 = PongEvent(eventname: "2v2 Masters Practice", eventplace: "@A-side", eventwhen: "5 days ago", eventspots: 3, eventinviter: "Sam", eventinvitees: ["Ethan","Dbo","Yang","Leimbach"])
let exampleponggame2 = PongEvent(eventname: "Hitting around", eventplace: "@C-side", eventwhen: "3 days ago", eventspots: 3, eventinviter: "Sam", eventinvitees: ["Ethan","Dbo","Vallacher"])
let exampleponggame3 = PongEvent(eventname: "1v1 tourny", eventplace: "@B-side", eventwhen: "10 days ago", eventspots: 1, eventinviter: "Ethan", eventinvitees: ["Sam"])
let exampleponggame4 = PongEvent(eventname: "1v1 practice", eventplace: "@Q-side", eventwhen: "1 days ago", eventspots: 1, eventinviter: "Ethan", eventinvitees: ["Sam","Dbo","Vallacher","Yang"])
let exampleponggame5 = PongEvent(eventname: "Harbor", eventplace: "@Basement", eventwhen: "2 days ago", eventspots: 7, eventinviter: "Dbo", eventinvitees: ["Sam","Dbo","Vallacher","Yang","Leimbach","Ethan","Bitches"])

// make a table of all events in the universe.
var alleventtable: [PongEvent] {
    get {
    return [exampleponggame1,exampleponggame2,exampleponggame3,exampleponggame4,exampleponggame5]
    }
}

alleventtable

for i in alleventtable {
    println("go")
}


alleventtable[4].eventinviter


//Make a function to filter out only the events that are yours.
// Of the full table of events, return just those where "Sam" was the event creator.

func yourevents(inviter: String, table: [PongEvent]) -> [PongEvent] {  //input: inverter sting; output: array of PongEvents.
    var youreventtable: [PongEvent] = []
    for i in table {    // Cycle through all events.
        // If the event is by the user, add it to "yourevents".
        if i.eventinviter == inviter {
            //println("\(i) times 5 is \(i)")
            youreventtable.append(i)
        }
    }
    return youreventtable
}

yourevents("Sam",alleventtable)









