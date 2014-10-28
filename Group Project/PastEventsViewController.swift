//
//  PastEventsViewController.swift
//  Group Project
//
//  Created by Ida Leung on 10/26/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class PastEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var currentEvents = [
        [
            "title": "AUGUST",
            "events": [
                [
                    "event":"John's BBQ",
                    "address":"14 Harvard St",
                    "response":"Yes",
                    "date":"8/2",
                    "detail-date":"Saturday – August 2",
                    "time":"11:45pm",
                    "host":"a_1x"
                ],
                [
                    "event":"Oyster Party",
                    "address":"Point Reyes",
                    "response":"Invited",
                    "date":"8/3",
                    "detail-date":"Sunday – August 3",
                    "time":"9:30am",
                    "host":"c_1x"
                ]
            ]
        ],
        [
            "title": "SEPTEMBER",
            "events": [
                [
                    "event":"Fall Picnic",
                    "address":"Golden Gate Park",
                    "response":"Maybe",
                    "date":"9/7",
                    "detail-date":"Sunday – September 7",
                    "time":"1:00pm",
                    "host":"a_1x"
                ],
                [
                    "event":"Beach Bonfire",
                    "address":"Ocean Beach",
                    "response":"Invited",
                    "date":"9/19",
                    "detail-date":"Friday – September 19",
                    "time":"9:00pm",
                    "host":"b_1x"
                ],
                [
                    "event":"Steven's Graduation Party",
                    "address":"1017 20th St",
                    "response":"No",
                    "date":"9/26",
                    "detail-date":"Friday – September 26",
                    "time":"6:00pm",
                    "host":"d_1x"
                ]
            ]
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        var defaults = NSUserDefaults.standardUserDefaults()
        var newUser = defaults.integerForKey("new_user")

        // 1 is new, 0 is existing
        if ( newUser == 1 ) {
            tableView.hidden = true
//            emptyPast.alpha = 1
            println("new")
        } else {
            println("easdfasdfasdfxisitng")
        }

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
        cell.hostAvatar.image = UIImage(named: currentEvent["host"]!)

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
        label.textColor = UIColor(red: 0.992, green: 0.502, blue: 0.137, alpha: 1)
        headerView.addSubview(label)

        return headerView
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var eventViewController = segue.destinationViewController as PastDetailEventViewController
        let indexPath = self.tableView.indexPathForSelectedRow()!


        // 1. figure out which event was pressed
        let eventsInSection = currentEvents[indexPath.section]["events"] as Array<Dictionary<String, String>>
        let event = eventsInSection[indexPath.row]

        // 2. hand it to  eventViewController
        eventViewController.detailEvent = event
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
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
