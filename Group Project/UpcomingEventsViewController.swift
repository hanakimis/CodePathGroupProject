//
//  UpcomingEventsViewController.swift
//  Group Project
//
//  Created by Ida Leung on 10/26/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class UpcomingEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyIntro: UIImageView!
    var loadCount = 0

    var currentEvents = [
        [
            "title": "OCTOBER",
            "events": [
                [
                    "event":"Sarah's Babyshower",
                    "address":"456 Grant Ave",
                    "response":"Host",
                    "date":"10/11",
                    "detail-date":"Saturday – October 11",
                    "time":"11:30am",
                    "host":"h_1x"
                ],
                [
                    "event":"Sam's Going Away",
                    "address":"3010 20th St",
                    "response":"Maybe",
                    "date":"10/17",
                    "detail-date":"Friday – October 17",
                    "time":"7:00pm",
                    "host":"b_1x"
                ],
                [
                    "event":"Bob's Birthday",
                    "address":"111 Market St.",
                    "response":"No",
                    "date":"10/20",
                    "detail-date":"Monday - October 20",
                    "time":"7:30pm",
                    "host":"c_1x"
                ]
            ]
        ],
        [
            "title": "DECEMBER",
            "events": [
                [
                    "event":"Happy hour",
                    "address":"Rincon Hill, Apt #3",
                    "response":"Yes",
                    "date":"12/9",
                    "detail-date":"Tuesday – December 9",
                    "time":"6:00PM",
                    "host":"d_1x"
                ],
                [
                    "event":"Craft Night",
                    "address":"1314 35th Ave",
                    "response":"Invited",
                    "date":"12/21",
                    "detail-date":"Sunday - December 21",
                    "time":"2:00pm",
                    "host":"e_1x"
                ],
                [
                    "event":"Dinner with Paloma",
                    "address":"Ragazza",
                    "response":"Host",
                    "date":"12/23",
                    "detail-date":"Tuesday – December 23",
                    "time":"6:30PM",
                    "host":"h_1x"
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
            emptyIntro.alpha = 1
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

        if (cell.responseLabel.text == "Invited"){
            cell.hostBox.alpha = 1
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
        label.font = UIFont.boldSystemFontOfSize(13)
        label.textColor = UIColor(red: 1, green: 0.533, blue: 0.027, alpha: 1)
        headerView.addSubview(label)

        return headerView

    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    
    @IBAction func onAddEvent(sender: AnyObject) {
        performSegueWithIdentifier("AddEventSegue", sender: self)
        self.loadCount += 1
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "DetailEventSegue"{
            var eventViewController = segue.destinationViewController as EventViewController
            let indexPath = self.tableView.indexPathForSelectedRow()!

            // 1. figure out which event was pressed
            let eventsInSection = currentEvents[indexPath.section]["events"] as Array<Dictionary<String, String>>
            let event = eventsInSection[indexPath.row]

            // 2. hand it to  eventViewController
            eventViewController.detailEvent = event

        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        if loadCount > 0 {
            println("1")
        }
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
