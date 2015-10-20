//
//  TimerViewController.swift
//  Timer
//
//  Created by Eric Mead on 10/19/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var pauseButtonLabel: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func pauseButton(sender: UIButton) {
    
        timer.stopTimer()
        
        
        if pauseButtonLabel.titleLabel?.text == "Resume"{
          print("it is resume")
            timer.startTimer()
             pauseButtonLabel.setTitle("Pause", forState: .Normal)
        } else { pauseButtonLabel.setTitle("Resume", forState: .Normal)}
    
    }
    
    @IBAction func startButton(sender: UIButton) {
        
        let hours = hourPickerView.selectedRowInComponent(0)
        let minutes = minutePickerView.selectedRowInComponent(0) + (hours * 60)
        let totalSecondsSetOnTimer = NSTimeInterval(minutes * 60)
        
        timer.setTime(totalSecondsSetOnTimer, totalSeconds: totalSecondsSetOnTimer)
        
        timer.startTimer()
        
        
        if startButtonLabel.titleLabel?.text == "Cancel"{
            print("it is Cancel")
            timer.stopTimer()
            timerLabel.alpha = 0.0
            hoursLabel.alpha = 1.0
            minutesLabel.alpha = 1.0
            minutePickerView.alpha = 1.0
            hourPickerView.alpha = 1.0
            startButtonLabel.setTitle("Start", forState: .Normal)
        } else {
            startButtonLabel.setTitle("Cancel", forState: .Normal)
            
        }

        
    }
    
    @IBOutlet weak var startButtonLabel: UIButton!
    
    @IBOutlet weak var hourPickerView: UIPickerView!
    
    @IBOutlet weak var minutePickerView: UIPickerView!
    
   let timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let now = NSDate()
//        var nsDateFormatter = NSDateFormatter()
//        nsDateFormatter.dateStyle = .MediumStyle
//        var date = nsDateFormatter.stringFromDate(now)
//        print(date)
        
        guard let scheduledNotifications = UIApplication.sharedApplication().scheduledLocalNotifications else { return }
        
        timer.stopTimer()
        
        
        
        for notification in scheduledNotifications {
            if notification.category == Timer.TimerAlert {
                
                UIApplication.sharedApplication().cancelLocalNotification(notification)
                
               
                
               /* guard let fireDate = notification.fireDate, let userInfo = notification.userInfo as? [String : NSTimeInterval], let totalTime = userInfo[Timer.TotalSeconds] else { return }
                let timeRemainingOnCountdown = fireDate.timeIntervalSinceDate(now)
                timer.setTime(timeRemainingOnCountdown, totalSeconds: totalTime)*/
                
                
                updateTimerBasedViews()
                
                timer.startTimer()
                
                switchToTimerView()
            }
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateTimerBasedViews", name: Timer.TimerSecondTickNotification, object: timer)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "timerComplete", name: Timer.TimerCompleteNotification, object: timer)
        
        minutePickerView.selectRow(1, inComponent: 0, animated: false)
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == hourPickerView {
                    return 24
                } else {
                       return 60
                    }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //MARK: - UIPickerView Delegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return String(row)
    }
    
    func switchToTimerView(){
            
    }
        
    func updateTimerBasedViews(){
        hoursLabel.alpha = 0.0
        minutesLabel.alpha = 0.0
        timerLabel.alpha = 1.0
        minutePickerView.alpha = 0.0
        hourPickerView.alpha = 0.0
        timerLabel.text = timer.timerString()
        print(timer.timerString())
    }
    
    func timerComplete(){
    
    let timerCompleteAlert = UIAlertController(title: "Wake Up!", message: "Your timer has gone off!", preferredStyle: .Alert)
    let okButton = UIAlertAction(title: "Ok!", style: .Default, handler: nil)
    timerCompleteAlert.addAction(okButton)
    presentViewController(timerCompleteAlert, animated: true, completion: nil)
        
    }

  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
