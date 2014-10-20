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

    @IBAction func onCreateAccountButton(sender: AnyObject) {
        
        if (self.nameTextField.text.isEmpty) {
            var noNameAlertView = UIAlertView(title: "Full Name Required", message: "Please enter your first and last name", delegate: nil, cancelButtonTitle: "OK")
            noNameAlertView.show()
            
            
        } else if (self.emailTextField.text.isEmpty) {
            
            var noNameAlertView = UIAlertView(title: "Email Address Required", message: "Please enter an email address", delegate: nil, cancelButtonTitle: "OK")
            noNameAlertView.show()
            
        } else if (!isValidEmail(emailTextField.text)) {
            
            var invalidEmailAlertView = UIAlertView(title: "Valid Email Address Required", message: "Please enter a valid email address", delegate: nil, cancelButtonTitle: "OK")
            invalidEmailAlertView.show()
            
        } else if (self.passwordTextField.text.isEmpty) {
            
            var noPasswordAlertView = UIAlertView(title: "Password Required", message: "Please enter a password", delegate: nil, cancelButtonTitle: "OK")
            noPasswordAlertView.show()

        } else if (self.confirmTextField.text.isEmpty) {

            var noConfirmPasswordAlertView = UIAlertView(title: "Password Confirm Required", message: "Please confirm your password", delegate: nil, cancelButtonTitle: "OK")
            noConfirmPasswordAlertView.show()
            
        } else if (self.passwordTextField.text) != (self.confirmTextField.text) {

            var incorrectPasswordAlertView = UIAlertView(title: "Passwords Do Not Match", message: "Please re-enter your password and password confirmation", delegate: nil, cancelButtonTitle: "OK")
            incorrectPasswordAlertView.show()

        } else {
            
            var create2AlertView = UIAlertView(title: "Creating account...", message: nil, delegate: nil, cancelButtonTitle: nil)
            create2AlertView.show()

            delay(2, closure: { () -> () in
                create2AlertView.dismissWithClickedButtonIndex(0, animated: true)            
                self.performSegueWithIdentifier("CreateAccountToTabBarSegue", sender: nil)
            })


        }
        
        
    }


    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

        var emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluateWithObject(testStr)
        return result
    }

    
    
}
