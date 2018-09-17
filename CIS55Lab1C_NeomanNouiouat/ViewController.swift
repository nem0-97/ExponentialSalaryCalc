//
//  ViewController.swift
//  CIS55Lab1C_NeomanNouiouat
//
//  Created by neoman nouiouat on 5/5/17.
//  Copyright © 2017 deanza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var daysCalc: UITextField!
    @IBOutlet weak var startPay: UITextField!
    @IBOutlet weak var output: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Calculate(_ sender: Any) {
        output.text = ""
        let days = (daysCalc.text! as NSString).integerValue
        let start=(startPay.text! as NSString).integerValue
        var dailyPay : Array<Int> = []
        var runningTotals : Array<Int>  = []
        
        for i in 0..<days{
            if i==0{
                dailyPay+=[start]
                runningTotals+=[start]
            }
            else{
                dailyPay+=[dailyPay[i-1]*2]
                runningTotals+=[runningTotals[i-1]+dailyPay[i]]
            }
            output.text = output.text + "Day: " + String(i+1) + "\n" + "\tToday's Pay: "
            output.text = output.text + String(format:"$%.2f",Double(dailyPay[i])/100) + "\n\tTotal:             "
            output.text = output.text + String(format:"$%.2f",Double(runningTotals[i])/100)+"\n"
            if i==days-1{
                let ave = Double(runningTotals[i])/100.0/Double(days)
                output.text = output.text + "\nStats: \n\tAverage Daily Pay:        $" + String(format:"%.2f",ave)
                output.text = output.text+"\n\tTotal for Pay Period:     $" + String(format:"%.2f",Double(runningTotals[i])/100)
            }
        }
        
        
    }

}

