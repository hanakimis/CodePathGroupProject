//
//  TableViewViewController.swift
//  Group Project
//
//  Created by Ida Leung on 10/18/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {




    @IBOutlet weak var tableView: UITableView!    
    var currentEvents = [
        [
            "title": "First section",
            "events": [
                [
                    "event":"JJ's BBQ",
                    "address":"Mission",
                    "response":"Yes",
                    "date":"6/11",
                    "time":"9:00PM"
                ],
                [
                    "event":"Snowboarding",
                    "address":"Mission",
                    "response":"Invited",
                    "date":"7/11",
                    "time":"9:00PM"
                ],
                [
                    "event":"stuff",
                    "address":"Mission",
                    "response":"No",
                    "date":"8/11",
                    "time":"9:00PM"
                ]
            ]
        ],
        [
            "title": "second section 2",
            "events": [
                [
                    "event":"Happy hour",
                    "address":"Rincon hill",
                    "response":"Yes",
                    "date":"6/14",
                    "time":"6:00PM"
                ],
                [
                    "event":"Shopping",
                    "address":"Union square",
                    "response":"Invited",
                    "date":"7/14",
                    "time":"2:00PM"
                ]
            ]
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        tableView.rowHeight = 78
        tableView.layer.cornerRadius = 2.0
        //tableView.frame.width = 304

        // Do any additional setup after loading the view.
    }



    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let events = currentEvents[section]["events"] as NSArray
        return events.count
        //when link to external file
        //return pastEvents.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCellWithIdentifier("EventCell") as EventCell

        let events = currentEvents[indexPath.section]["events"] as Array<Dictionary<String, String>>
        var currentEvent = events[indexPath.row]
//
        cell.eventName.text = currentEvent["event"]
        cell.addressLabel.text = currentEvent["address"]
        cell.responseLabel.text = currentEvent["response"]
        cell.dateLabel.text = currentEvent["date"]
        cell.timeLabel.text = currentEvent["time"]
        
        if (cell.responseLabel.text == "Invited"){
            println("test")
        
        }
        
        return cell

    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return currentEvents.count
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        //top-level header
        var headerView = UIView(frame: CGRect(x: 10, y: 0, width: 310, height: 30))
        headerView.backgroundColor = UIColor(white: 0.8, alpha: 0.8)

        //add label

        var label = UILabel(frame: headerView.frame)
        label.text = currentEvents[section]["title"] as String?
        label.font = UIFont.boldSystemFontOfSize(14)
        
        headerView.addSubview(label)

        return headerView

    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println("selected")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
