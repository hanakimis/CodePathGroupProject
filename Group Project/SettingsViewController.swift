//
//  SettingsViewController.swift
//  Group Project
//
//  Created by Hana Kim on 10/14/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var selectedTextField: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.tag  = 0
        emailTextField.tag = 1
        
        oldPasswordTextField.tag     = 2
        newPasswordTextField.tag     = 3
        confirmPasswordTextField.tag = 4
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
         /*       if (self.selectedTextField <= 1.0) {
                    self.passwordView.alpha = 0
                } else {
                    self.profileView.alpha = 0
                    self.passwordView.frame.origin = CGPoint(x: 0.0, y: 74.0)
                }*/
            }, completion: nil)
    }
    

    
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
         /*   if (self.selectedTextField <= 1) {
                self.passwordView.alpha = 1
            } else {
                self.profileView.alpha = 1
                self.passwordView.frame.origin = CGPoint(x: 0.0, y: 243.0)
            }*/
            }, completion: nil)
    }
    
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        selectedTextField = textField.tag
        println("current sleected Text Field \(selectedTextField)")
        return true
    }
    
    @IBAction func onTapTextField(sender: UITextField) {
       // selectedTextField = sender.tag
        println("current sleected Text Field \(selectedTextField)")
    }
    
    
    @IBAction func onTapView(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
