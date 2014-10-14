//
//  CreateEventViewController.swift
//  Group Project
//
//  Created by Hana Kim on 9/30/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CreateEventViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var tempMapImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var dp = UIDatePicker()
        dateTextField.inputView = dp
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        tempMapImage.hidden = true

    }
    
    
    

    @IBAction func onTapBackground(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    
    @IBAction func onTapBackButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
