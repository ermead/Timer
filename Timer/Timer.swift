//
//  Timer.swift
//  Timer
//
//  Created by Eric Mead on 10/19/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class Timer: NSObject {
    
    static let TimerSecondTickNotification = "Timer Second Tick"
    static let TimerCompleteNotification = "Timer Complete Notification"
    
    private(set) var seconds = NSTimeInterval(0)
    private(set) var totalSeconds = NSTimeInterval(0)
    private var timer: NSTimer?
    var isOn: Bool
}

func setTime(second: NSTimeInterval, totalSeconds: NSTimeInterval){
    
}

func startTimer(){
    
}

func stopTimer(){
    
}

func secondTick(){
    
}

func timerString() -> String{
    
}