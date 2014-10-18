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
        return 5
        //when link to external file
        //return pastEvents.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCellWithIdentifier("EventCell") as EventCell

        //when link to external file
        //var pastEvent = pastEvents[indexPath.row]
//        cell.eventName.text = "event"
//        cell.addressLabel.text = "address"
//        cell.responseLabel.text = "response"
//        cell.dateLabel.text = "date"
//        cell.timeLabel.text = "time"

        cell.eventName.text = "JJ's"
        cell.addressLabel.text = "Mission"
        cell.responseLabel.text = "Yes"
        cell.dateLabel.text = "9/20"
        cell.timeLabel.text = "5:00 PM"

        return cell

    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {

        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        println("selected")
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        //top-level header
        var headerView = UIView(frame: CGRect(x: 10, y: 0, width: 310, height: 100))
        headerView.backgroundColor = UIColor(white: 0.8, alpha: 0.8)

        //add label
        var label = UILabel(frame: headerView.frame)
        label.text = "Section"
        label.font = UIFont.systemFontOfSize(20)

        headerView.addSubview(label)

        return headerView

    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
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
