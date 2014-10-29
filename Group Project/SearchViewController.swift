//
//  SearchViewController.swift
//  Group Project
//
//  Created by Jessica Jarvis on 10/21/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //VARS
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    var userCount = 0

    
    var results: [NSDictionary] = []
    
    var users = [
        [
            "name":"Ashley Hawkins",
            "userImage":"ashley",
            "email":"ashleyhawkins@gmail.com"
        ]

    ]


    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 84
        


        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //TABLE VIEW FUNCTIONS
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if (self.searchField.text == "Ashley Hawkins") {

            return users.count

        } else {

            return 0

        }

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier("SearchTableViewCell") as SearchTableViewCell
        
        var user = users[indexPath.row]
        var imageName = user["userImage"] as String!
        
        cell.contactName.text = user["name"]
        cell.contactImage.image = UIImage(named: imageName)

        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println("You selected row \(indexPath.row) in section \(indexPath.section)")
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell!.accessoryType = .Checkmark
        
    }
    
    @IBAction func onSearchButton(sender: AnyObject) {

        tableView.reloadData()

    }


    @IBAction func onDoneButton(sender: AnyObject) {

        dismissViewControllerAnimated(true, completion: nil)

    }
    
    @IBAction func onCancelButton(sender: AnyObject) {

        dismissViewControllerAnimated(true, completion: nil)
    }


}
