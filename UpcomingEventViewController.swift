//
//  UpcomingEventViewController.swift
//  Group Project
//
//  Created by Ida Leung on 10/25/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class UpcomingEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyIntro: UIImageView!
        var currentEvents = [
            [
                "title": "OCTOBER",
                "events": [
                    [
                        "event":"Sarah's Babyshower",
                        "address":"456 Grant Ave",
                        "response":"Yes",
                        "date":"10/14",
                        "detail-date":"Sunday - October 14",
                        "time":"9:00PM",
                        "host":"h_1x"
                    ],
                    [
                        "event":"Sam's Going Away",
                        "address":"3010 20th St",
                        "response":"Invited",
                        "date":"7/11",
                        "detail-date":"Saturday - July 11",
                        "time":"9:00PM",
                        "host":"b_1x"
                    ],
                    [
                        "event":"stuff",
                        "address":"Mission",
                        "response":"No",
                        "date":"8/11",
                        "detail-date":"Monday - August 11",
                        "time":"9:00PM",
                        "host":"c_1x"
                    ]
                ]
            ],
            [
                "title": "DECEMBER",
                "events": [
                    [
                        "event":"Happy hour",
                        "address":"Rincon hill",
                        "response":"Yes",
                        "date":"6/14",
                        "time":"6:00PM",
                        "host":"d_1x"
                    ],
                    [
                        "event":"Shopping",
                        "address":"Union square",
                        "response":"Invited",
                        "date":"7/14",
                        "time":"2:00PM",
                        "host":"e_1x"
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
                tableView.alpha = 0
                emptyIntro.alpha = 1
                println("new")
            } else {
                println("easdfasdfasdfxisitng")
            }
//
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
            label.textColor = UIColor(red: 0.992, green: 0.502, blue: 0.137, alpha: 1)

            headerView.addSubview(label)

            return headerView

        }

        func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 30
        }

        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
            var eventViewController = segue.destinationViewController as EventViewController
            let indexPath = self.tableView.indexPathForSelectedRow()!


            // 1. figure out which event was pressed
            let eventsInSection = currentEvents[indexPath.section]["events"] as Array<Dictionary<String, String>>
            let event = eventsInSection[indexPath.row]

            // 2. hand it to  eventViewController
            eventViewController.detailEvent = event
        }
        
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

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
