//
//  TimerViewController.swift
//  Timer
//
//  Created by Eric Mead on 10/19/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBAction func pauseButton(sender: UIButton) {
    }
    
    @IBAction func startButton(sender: UIButton) {
    }
    
    @IBOutlet weak var hourPickerView: UIPickerView!
    
    @IBOutlet weak var minutePickerView: UIPickerView!
    
   let timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let scheduledNotifications = UIApplication.sharedApplication().scheduledLocalNotifications else { return }
        
        timer.stopTimer()
        
        for notification in scheduledNotifications {
            if notification.category == Timer.TimerAlert {
                
                UIApplication.sharedApplication().cancelLocalNotification(notification)
                
                let now = NSDate()
                
                guard let fireDate = notification.fireDate, let userInfo = notification.userInfo as? [String : NSTimeInterval], let totalTime = userInfo[Timer.TotalSeconds] else { return }
                let timeRemainingOnCountdown = fireDate.timeIntervalSinceDate(now)
                timer.setTime(timeRemainingOnCountdown, totalSeconds: totalTime)
                
                updateTimerBasedViews()
                
                timer.startTimer()
                
                switchToTimerView()
            }
        }

        // Do any additional setup after loading the view.
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
            
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
