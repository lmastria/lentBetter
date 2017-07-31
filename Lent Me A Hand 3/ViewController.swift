//
//  ViewController.swift
//  Lent Me A Hand 3
//
//  Created by Lou Mastria on 7/28/17.
//  Copyright © 2017 Mastria, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var lentYesNo: UILabel!
    @IBOutlet weak var meatFish: UILabel!
    @IBOutlet weak var daysLeft: UILabel!
    @IBOutlet weak var daysLeftOrTill: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Let's Figure out what day it is
       
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from:date )
        let month = calendar.component(.month, from:date )
        let day = calendar.component(.day, from:date )
        let dayOfWeek = calendar.component(.weekday, from:date ) - 1
        let daysOfWeek = ["Sunday","Monday","Tuesday","Wednesday", "Thursday", "Friday", "Saturday"]
        var weekDay = (daysOfWeek[dayOfWeek])
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd,yyyy"
        
        print ("Today is \(weekDay) \(formatter.string(from: NSDate() as Date))")
        
        todayLabel.text = ("Today is \(weekDay) \(formatter.string(from: NSDate() as Date))")
        

        //Is today inside current Lent?//
        var currentLentDateStartComponents = DateComponents()
        currentLentDateStartComponents.year = 2017
        currentLentDateStartComponents.month = 3
        currentLentDateStartComponents.day = 1
        let currentLentDateStart = calendar.date(from: currentLentDateStartComponents)!
        let myFormatter = DateFormatter()
        myFormatter.dateStyle = .full
        myFormatter.string(from: currentLentDateStart)
        
        var currentLentDateStopComponents = DateComponents()
        currentLentDateStopComponents.year = 2017
        currentLentDateStopComponents.month = 4
        currentLentDateStopComponents.day = 16
        let currentLentDateStop = calendar.date(from: currentLentDateStopComponents)!
        myFormatter.dateStyle = .full
        myFormatter.string(from: currentLentDateStop)
        
        
        
        print("In \(currentLentDateStartComponents.year!), Lent begins on \(myFormatter.string(from: currentLentDateStart)).")
        
        print("Easter Sunday is the end of Lent and it will be on \(myFormatter.string(from: currentLentDateStop)).")
        
        if (date >= currentLentDateStart && date <= currentLentDateStop) {
            print("You are inside Lent for \(currentLentDateStopComponents.year!).")
            lentYesNo.text = ("Yes")
        } else {
            print("You are outside of Lent for \(currentLentDateStopComponents.year!).")
            lentYesNo.text = ("No")
        }
        
        if  (date >= currentLentDateStart && date <= currentLentDateStop) && (weekDay == "Friday"){
            print("Today is \(weekDay)...watch out for meat cravings.")
            meatFish.text = ("Today is \(weekDay)...watch out for meat cravings.")
            if (date == currentLentDateStart){
                print("Today is Ash Wednesday, watch out for meat cravings and go get your ashes.")
                meatFish.text = ("Today is Ash Wednesday, watch out for meat cravings and go get your ashes.")
            }
        } else {
            print("It's ok to eat meat today.")
            meatFish.text = ("It's ok to eat meat today.")
        }

        //Let's figure out when the Next Lenten Period is //
        
        var nextLentDateComponents = DateComponents()
        nextLentDateComponents.year = 2018
        nextLentDateComponents.month = 2
        nextLentDateComponents.day = 14
        let nextLentDate = calendar.date(from: nextLentDateComponents)!
        //let myFormatter = DateFormatter()
        myFormatter.dateStyle = .full
        myFormatter.string(from: nextLentDate)
        
        //let string2 = dateFormatter.string(from: nextLentDate as Date)
        print ("The next Lenten period will start \(myFormatter.string(from: nextLentDate)).")
        
        //Countdown until next Lent//
        
        // Countdown 5
        // actuallly working!!!!
        
        
        //let currentCalendar = Calendar.current
        
        let todaysDate = Date()
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        let todaysYear =  components.year
        let todaysMonth = components.month
        let todaysDay = components.day
        let todaysToday = calendar.date(from: components)!
        
        
        
        
        myFormatter.dateStyle = .full
        myFormatter.string(from: todaysToday)
        
        myFormatter.string(from: nextLentDate)
        
        let start = calendar.ordinality(of: .day, in: .era, for: todaysToday)
        let end = calendar.ordinality(of: .day, in: .era, for: nextLentDate)
        
        print (start!)
        print (end!)
        if (start! < end!) {
            daysLeftOrTill.text = ("Number of days until Lent:")
        }
        else {
            daysLeftOrTill.text = ("Number of days until Lent ends:")
        }
        
        print ("There are \( abs(end! - start!) ) days until next Lent.")
        daysLeft.text = ("There are \( abs(end! - start!) ) days until next Lent.")

        //Commit test
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

