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

    
    var results: [NSDictionary] = []
    
    var users = [
        [
            "name":"Aaron Hirshberg",
            "userImage":"aaron",
            "email":"aaronhirshberg@gmail.com"
        ],
        [
            "name":"Alek Lisefski",
            "userImage":"alek",
            "email":"aleklisefski@gmail.com"
        ],
        [
            "name":"Anna Baumann",
            "userImage":"anna",
            "email":"annabaumann@gmail.com",
        ],
        [
            "name":"Chris Lynch",
            "userImage":"chris",
            "email":"chrislynch@gmail.com"
        ],
        [
            "name":"Claire Witherspoon",
            "userImage":"claire",
            "email":"clairewitherspoon@gmail.com"
        ],
        [
            "name":"Eli Rubel",
            "userImage":"eli",
            "email":"elirubel@gmail.com"
        ],
        [
            "name":"Heather Hartnett",
            "userImage":"heather",
            "email":"heatherhartnett@gmail.com"
        ],
        [
            "name":"Helena Price",
            "userImage":"helena",
            "email":"helenaprice@gmail.com"
        ],
        [
            "name":"Jeff Yip",
            "userImage":"jeff",
            "email":"jeffyip@gmail.com"
        ],
        [
            "name":"Katy Kirbach",
            "userImage":"katy",
            "email":"katykirbach@gmail.com"
        ],
        [
            "name":"Olivia Lopez",
            "userImage":"olivia",
            "email":"olivialopez@gmail.com"
        ],
        [
            "name":"Samantha Harmon",
            "userImage":"samantha",
            "email":"samanthaharmon@gmail.com"
        ],
        [
            "name":"Shane Bellmer",
            "userImage":"shane",
            "email":"shanebellmer@gmail.com"
        ],
        [
            "name":"Wes Dearborn",
            "userImage":"wes",
            "email":"wesdearborn@gmail.com"
        ],
    ]


    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 84
        
        searchField.becomeFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //TABLE VIEW FUNCTIONS
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
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
    
    


}