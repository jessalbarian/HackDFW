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
import AVFoundation
import Firebase


class ViewController: UIViewController, CLLocationManagerDelegate {
    //----------
    // VARIABLES
    //----------
    let university_name = "University of Colorado Boulder"
    let phoneNumber = "7206207466" // testing calling
    
    @IBOutlet var fade: UIImageView! // btn fade image
    
    @IBOutlet var universityLabel: UILabel!
    
    var locationManager = CLLocationManager()
    
    let ref = Firebase(url: "https://bluelightapp.firebaseio.com/")
    var locations = [Location]()
    
    //-------------------
    // MAIN CALL FUNCTION
    //-------------------
    @IBAction func blueBtn(sender: AnyObject) {
        let url:NSURL = NSURL(string: "tel://\(phoneNumber)")!
        UIApplication.sharedApplication().openURL(url)
    }
    
    
    
    //--------------------
    // MAIN FADE ANIMATION
    //--------------------
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
    
    
//-------------------
// LOCATION FUNCTIONS
//-------------------
    //called when the authorization status for the application changed.
    func locationManager(manager: CLLocationManager,
                         didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("didchangeauth")
        if status==CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.startUpdatingLocation() //starts the location
            manager
        }
    }
    
    
    //called when a location cannot be determined
    func locationManager(manager: CLLocationManager, didFailWithError
        error: NSError) {
        var errorType=String()
        if let clError=CLError(rawValue: error.code) {
            if clError == .Denied {
                errorType="access denied"
                let alert=UIAlertController(title: "Error", message:
                    errorType, preferredStyle: UIAlertControllerStyle.Alert)
                let okAction:UIAlertAction=UIAlertAction(title: "OK",
                                                         style:UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion:
                    nil)
            }
        }
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change color of navbar and text
        self.navigationItem.title = "BlueLight"
        navigationController!.navigationBar.barTintColor = UIColor.blackColor()
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        universityLabel.text = university_name
        
        // Timer for main btn animation
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.fadeAnimation(_:)), userInfo: nil, repeats: true)
        
        
        let location = CLLocationCoordinate2D(
            latitude: 40.74836,
            longitude: -73.984607
        )
        
        
        let status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        if status==CLAuthorizationStatus.NotDetermined{
            locationManager.requestWhenInUseAuthorization() //ios 8 and later only
        }
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.distanceFilter=kCLDistanceFilterNone
        
        
    
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

