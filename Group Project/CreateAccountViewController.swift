//
//  CreateAccountViewController.swift
//  Group Project
//
//  Created by Hana Kim on 9/30/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    //VARS
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: 320, height: 568)

        //KEYBOARD SCROLL HANDLING
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //CANCEL BUTTON
    @IBAction func cancelCreateAccount(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //TAP TO DISMISS KEYBOARD
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    
    //KEYBOARD SCROLL HANDLING
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!

        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue

        UIView.animateWithDuration(animationDuration, delay: 0.15, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {

            self.scrollView.contentOffset.y = 100
            }, completion: nil)
    }

    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!

        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue

        UIView.animateWithDuration(animationDuration, delay: 0.15, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {

            self.scrollView.contentOffset.y = 0
            }, completion: nil)
    }

    //DELAY FUNCTION
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }


    //HIT CREATE ACCOUNT BUTTON
    /*@IBAction func onCreateAccountButton(sender: AnyObject) {

        if (self.emailTextField.text == "johnotis@gmail.com") && (self.passwordTextField.text == "password") {

            delay(2, closure: { () -> () in
                self.performSegueWithIdentifier("CreateAccountToTabBarSegue", sender: self)

            })

            var createAlertView = UIAlertView(title: "Creating account...", message: nil, delegate: nil, cancelButtonTitle: nil)
            createAlertView.show()

            delay(2, closure: { () -> () in
                createAlertView.dismissWithClickedButtonIndex(0, animated: true)
            })

        }

        else if (self.emailTextField.text == "") || (self.passwordTextField.text == "") || (self.nameTextField.text == "")  || (self.confirmTextField.text == "") {
            var emptyAlertView = UIAlertView(title: "All Fields Required", message: "Please be sure to fill out all fields", delegate: nil, cancelButtonTitle: "OK")
            emptyAlertView.show()


        }

        else {

            var create2AlertView = UIAlertView(title: "Creating account...", message: nil, delegate: nil, cancelButtonTitle: nil)
            create2AlertView.show()

            delay(2, closure: { () -> () in
                create2AlertView.dismissWithClickedButtonIndex(0, animated: true)


                var wrongAlertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: nil, cancelButtonTitle: "Try again")
                wrongAlertView.show()
            })


        }


    }*/
    
    
}
