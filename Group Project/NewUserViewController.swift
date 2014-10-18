//
//  NewUserViewController.swift
//  Group Project
//
//  Created by Ida Leung on 10/16/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var intro_3: UIImageView!
    @IBOutlet weak var intro_2: UIImageView!
    @IBOutlet weak var intro_1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self

        scrollView.contentSize = CGSize(width: 960, height: 568)

        println("test")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))

        // Set the current page, so the dots will update
        //pageControl.currentPage = page

//        if (page == 3) {
//            UIImageView.animateWithDuration(0.5){self.backupButton.alpha = 1}
//            UIImageView.animateWithDuration(0.5){self.pageControl.alpha = 0}
//
//        }

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
