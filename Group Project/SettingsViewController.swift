//
//  SettingsViewController.swift
//  Group Project
//
//  Created by Jessica Jarvis on 10/14/14.

//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {


    //VARS
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var chelseaImage: UIImageView!
    @IBOutlet weak var initialsImage: UIImageView!
    @IBOutlet weak var chelseaInitialsImage: UIImageView!
    @IBOutlet weak var removePhotoButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    var enteredText : String!
    var grayColor = UIColor(red: 0.153, green: 0.153, blue: 0.153, alpha: 1)
    @IBOutlet weak var libraryImage: UIImageView!


    //VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarImage.hidden = true
        initialsImage.hidden = false

        scrollView.contentSize = CGSize(width: 320, height: 568)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        //KEYBOARD STUFFS
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        var defaults = NSUserDefaults.standardUserDefaults()
        var newUser = defaults.integerForKey("new_user")
        if (newUser == 0) {
            //LOADING CONFIGURING OF PLACEHOLDERS
            configureNameTextField()
            configureEmailTextField()
            configureOldPasswordTextField()
            configureNewPasswordTextField()
            configureConfirmPasswordTextField()
            removePhotoButton.enabled = true
            chelseaImage.hidden = false
            chelseaInitialsImage.hidden = true
            avatarImage.hidden = true
            initialsImage.hidden = true
        } else {
            //LOADING CONFIGURING OF PLACEHOLDERS
            configureNameTextFieldNew()
            configureEmailTextFieldNew()
            configureOldPasswordTextFieldNew()
            configureNewPasswordTextFieldNew()
            configureConfirmPasswordTextFieldNew()
            removePhotoButton.enabled = false
            chelseaImage.hidden = true
            chelseaInitialsImage.hidden = true
            avatarImage.hidden = true
            initialsImage.hidden = false

        }        
        
        
    }
    
    //FUNCS FOR PLACEHOLDER TEXT EXSITING USER
    func configureNameTextField() {
        nameTextField.attributedPlaceholder = NSAttributedString(string:"Chelsea Briggs",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
    }
    
    func configureEmailTextField() {
        emailTextField.attributedPlaceholder = NSAttributedString(string:"chelseabriggs@gmail.com",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
    }
    func configureOldPasswordTextField() {
        oldPasswordTextField.attributedPlaceholder = NSAttributedString(string:"Old password",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
    }
    func configureNewPasswordTextField() {
        newPasswordTextField.attributedPlaceholder = NSAttributedString(string:"New password",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
    }
    func configureConfirmPasswordTextField() {
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string:"Confirm password",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
    }
    
    
    //FUNCS FOR PLACEHOLDER TEXT NEW USER
    func configureNameTextFieldNew() {
        nameTextField.attributedPlaceholder = NSAttributedString(string:"John Otis",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
    }
    
    func configureEmailTextFieldNew() {
        emailTextField.attributedPlaceholder = NSAttributedString(string:"johnotis@gmail.com",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
    }
    func configureOldPasswordTextFieldNew() {
        oldPasswordTextField.attributedPlaceholder = NSAttributedString(string:"Old password",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
    }
    func configureNewPasswordTextFieldNew() {
        newPasswordTextField.attributedPlaceholder = NSAttributedString(string:"New password",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
    }
    func configureConfirmPasswordTextFieldNew() {
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string:"Confirm password",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        
    }






    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //IMAGE PICKER
    @IBAction func onUpdatePhoto(sender: AnyObject) {
        var imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        //imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        imagePickerController.delegate = self
        self.presentViewController(imagePickerController, animated: true, completion: nil)
        removePhotoButton.enabled = true
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    
        var tempImage:UIImage = info[UIImagePickerControllerOriginalImage] as UIImage
        libraryImage.image = tempImage
        libraryImage.hidden = false
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    //KEYBOARD DISMISS TAP
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    
    //REMOVE IMAGE
    @IBAction func onRemoveImage(sender: AnyObject) {


        chelseaImage.hidden = true
        libraryImage.hidden = true
        chelseaInitialsImage.hidden = false
        removePhotoButton.enabled = false


    }


    //ADJUSTING SCROLL FOR KEYBOARD
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!

        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
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

        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue

        UIView.animateWithDuration(animationDuration, delay: 0.15, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {

            self.scrollView.contentOffset.y = 0
            }, completion: nil)
    }
    
    //SAVE BUTTON
    @IBAction func onSaveButton(sender: AnyObject) {

        var savingAlertView = UIAlertView(title: "Saving...", message: nil, delegate: nil, cancelButtonTitle: nil)
        savingAlertView.show()

        delay(2, closure: { () -> () in
            savingAlertView.dismissWithClickedButtonIndex(0, animated: true)
            self.oldPasswordTextField.text = ""
            self.newPasswordTextField.text = ""
            self.confirmPasswordTextField.text = ""
        })

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
