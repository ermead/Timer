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
    
    private(set) var seconds = NSTimeInterval(0)
    private(set) var totalSeconds = NSTimeInterval(0)
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
  return ""
}

func armNotification(){
        
}
}