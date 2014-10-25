//
//  SignInViewController.swift
//  Group Project
//
//  Created by Jessica Jarvis on 10/13/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    //VARS
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //DISMISS KEYBOARD
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    
    //HIT SIGN IN BUTTON
    @IBAction func onSignInButton(sender: AnyObject) {
        
        if (self.emailTextField.text == "chelseabriggs@gmail.com") && (self.passwordTextField.text == "password") {
            
            delay(2, closure: { () -> () in
                var defaults = NSUserDefaults.standardUserDefaults()
                defaults.setInteger(0, forKey: "new_user")
                defaults.synchronize()
                self.performSegueWithIdentifier("SignInToTabBarSegue", sender: self)
                
            })
            
            var signAlertView = UIAlertView(title: "Signing In...", message: nil, delegate: nil, cancelButtonTitle: nil)
            signAlertView.show()
            
            delay(2, closure: { () -> () in
                signAlertView.dismissWithClickedButtonIndex(0, animated: true)
            })
            
        } else if (self.emailTextField.text.isEmpty) {
            
            var noEmailAlertView = UIAlertView(title: "Email Required", message: "Please enter an email address", delegate: nil, cancelButtonTitle: "OK")
            noEmailAlertView.show()
            
        } else if (self.passwordTextField.text.isEmpty) {
            
            var noPasswordAlertView = UIAlertView(title: "Password Required", message: "Please enter your password", delegate: nil, cancelButtonTitle: "OK")
            noPasswordAlertView.show()
            
        } else {
            
            var sign2AlertView = UIAlertView(title: "Signing In...", message: nil, delegate: nil, cancelButtonTitle: nil)
            sign2AlertView.show()
            
            delay(2, closure: { () -> () in
                sign2AlertView.dismissWithClickedButtonIndex(0, animated: true)
                
                
                var wrongAlertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: nil, cancelButtonTitle: "Try again")
                wrongAlertView.show()
            })
        }
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
}
