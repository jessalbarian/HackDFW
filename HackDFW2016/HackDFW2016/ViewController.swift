//
//  ViewController.swift
//  HackDFW2016
//
//  Created by Jessie Albarian on 4/16/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let phoneNumber = "7206207466"
    
    
    @IBAction func blueBtn(sender: AnyObject) {
        callNumber(phoneNumber)
    }
    
    func callNumber(phoneNumber:String){
//        if let phoneCallURL:NSURL = NSURL(string: "tel://\(phoneNumber)") {
//            let application:UIApplication = UIApplication.sharedApplication()
//            if (application.canOpenURL(phoneCallURL)) {
//            application.openURL(phoneCallURL);
//            }
            UIApplication.sharedApplication().openURL(NSURL(string: "telprompt://9809088798")!)
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

