//
//  EditLocationViewController.swift
//  Group Project
//
//  Created by Hana Kim on 10/19/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class EditLocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var locations: [NSDictionary] = []
    var myTimer : NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 45
        
        searchTextField.becomeFirstResponder()
    }

    @IBAction func tests(sender: UITextField) {
        myTimer?.invalidate()
        myTimer = NSTimer.scheduledTimerWithTimeInterval(0.5,
            target: self,
            selector: Selector("updateTableStuff"),
            userInfo: nil,
            repeats: false)
    }
    
    func updateTableStuff() {
        var urlSafe = self.searchTextField.text.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
         var url = NSURL(string: "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(urlSafe)&key=AIzaSyCqVDQiAHTa0LsnKklqbP1iViYRSyzcR5k")
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            if error != nil {
                println("error: \(error.description)")
                
            } else  {
                var objects = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            
                self.locations = objects["predictions"] as [NSDictionary]
                self.tableView.reloadData()
            }
        }
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as LocationCell
        var place = cell.locationLabel.text!
        println("location \(place)")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("LocationCell") as LocationCell
        var location = locations[indexPath.row]
        cell.locationLabel.text = (location["description"] as String)
        
        return cell
    }

    @IBAction func tapCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
