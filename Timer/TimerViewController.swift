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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
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
