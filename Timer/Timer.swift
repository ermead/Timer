//
//  Timer.swift
//  Timer
//
//  Created by Eric Mead on 10/19/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class Timer: NSObject {
    
    static let TimerAlert = "Timer Alert"
    
    static let TimerSecondTickNotification = "Timer Second Tick"
    static let TimerCompleteNotification = "Timer Complete Notification"
    
    private(set) var seconds = NSTimeInterval(10)
    private(set) var totalSeconds = NSTimeInterval(10)
    private var timer: NSTimer?
    var isOn: Bool{
        get {
            if timer == nil {
                return false
            } else {
                return true
            }
        }
    }

private var localNotification = UILocalNotification?()
    
func setTime(seconds:NSTimeInterval, totalSeconds:NSTimeInterval){
        self.seconds = seconds
        self.totalSeconds = totalSeconds
    }


func startTimer(){
    if (timer == nil) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "secondTick", userInfo: nil, repeats: true)
        
        armNotification()
    }
}

func stopTimer(){
    if let timer = timer {
        timer.invalidate()
        self.timer = nil
        if let localNotification = localNotification {
            UIApplication.sharedApplication().cancelLocalNotification(localNotification)
        }
    }

    
}

func secondTick(){
    if timer != nil {
        seconds--;
        NSNotificationCenter.defaultCenter().postNotificationName(Timer.TimerSecondTickNotification, object: self)
        if seconds <= 0 {
            NSNotificationCenter.defaultCenter().postNotificationName(Timer.TimerCompleteNotification, object: self)
            stopTimer()
        }
    }
    
}

func timerString() -> String{
  
    let totalSeconds = Int(self.seconds)
    let hours = totalSeconds/3600
    let minutes = (totalSeconds/60 - (hours*60))
    let seconds = (totalSeconds - (minutes*60) - (hours*3600))
    
    var secondsString = ""
    if seconds < 10 {
        secondsString = "0\(seconds)"
    } else { secondsString = "\(seconds)"}
    
    var minutesString = ""
    if minutes < 10 {
        minutesString = "0\(minutes)"
    } else { minutesString = "\(minutes)"}
    
    var hoursString = ""
    if hours > 0 {
        hoursString = "\(hours):"
    }
    
    return ("\(hoursString)\(minutesString):\(secondsString)")
    

}

func armNotification(){
        
}
}