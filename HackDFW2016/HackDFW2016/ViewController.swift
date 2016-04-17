//
//  ViewController.swift
//  HackDFW2016
//
//  Created by Jessie Albarian on 4/16/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation




class ViewController: UIViewController {

    let phoneNumber = "7206207466"
    
    
    @IBOutlet var fade: UIImageView!
    
    @IBAction func blueBtn(sender: AnyObject) {
        callNumber(phoneNumber)
    }
    
    func callNumber(phoneNumber:String){
        let url:NSURL = NSURL(string: "tel://\(phoneNumber)")!
        UIApplication.sharedApplication().openURL(url)
    }
    
    
    
    func fadeAnimation(timer: NSTimer){
        
            // Fade out
            UIView.animateWithDuration(2.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.fade.alpha = 0.0
                }, completion: {
                    (finished: Bool) -> Void in
                    
                    //Once the label is completely invisible, set the text and fade it back in
//                    self.birdTypeLabel.text = "Bird Type: Swift"
                    
                    // Fade in
                    UIView.animateWithDuration(2.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                        self.fade.alpha = 1.0
                        }, completion: nil)
            })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.barTintColor = UIColor.blackColor()
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.fadeAnimation(_:)), userInfo: nil, repeats: true)
    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(true)
//        while(true){
//         fadeAnimation()
//        }
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

