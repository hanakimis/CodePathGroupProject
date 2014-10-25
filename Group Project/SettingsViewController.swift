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
    @IBOutlet weak var initialsImage: UIImageView!
    @IBOutlet weak var removePhotoButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!



    //VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarImage.hidden = false
        initialsImage.hidden = true

        scrollView.contentSize = CGSize(width: 320, height: 568)

        //KEYBOARD STUFFS
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        //LOADING CONFIGURING OF PLACEHOLDERS
        configureNameTextField()
        configureEmailTextField()
        configureOldPasswordTextField()
        configureNewPasswordTextField()
        configureConfirmPasswordTextField()

        
        
        
    }
    
    //FUNCS FOR PLACEHOLDER TEXT
    func configureNameTextField() {
        nameTextField.placeholder = NSLocalizedString("name", comment: "")
    }
    
    func configureEmailTextField() {
        emailTextField.placeholder = NSLocalizedString("email", comment: "")
    }
    func configureOldPasswordTextField() {
        oldPasswordTextField.placeholder = NSLocalizedString("old password", comment: "")
    }
    func configureNewPasswordTextField() {
        newPasswordTextField.placeholder = NSLocalizedString("new password", comment: "")
    }
    func configureConfirmPasswordTextField() {
        confirmPasswordTextField.placeholder = NSLocalizedString("confirm password", comment: "")
    }
    
    
    
    

    //FUNCS FOR PLACEHOLDER TEXT
    func configureNameTextField() {
        nameTextField.placeholder = NSLocalizedString("name", comment: "")
    }

    func configureEmailTextField() {
        emailTextField.placeholder = NSLocalizedString("email", comment: "")
    }
    func configureOldPasswordTextField() {
        oldPasswordTextField.placeholder = NSLocalizedString("old password", comment: "")
    }
    func configureNewPasswordTextField() {
        newPasswordTextField.placeholder = NSLocalizedString("new password", comment: "")
    }
    func configureConfirmPasswordTextField() {
        confirmPasswordTextField.placeholder = NSLocalizedString("confirm password", comment: "")
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
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    
        var tempImage:UIImage = info[UIImagePickerControllerOriginalImage] as UIImage
        initialsImage.image = tempImage
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    //KEYBOARD DISMISS TAP
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    
    //REMOVE IMAGE
    @IBAction func onRemoveImage(sender: AnyObject) {

        avatarImage.hidden = true
        initialsImage.hidden = false
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

            self.scrollView.contentOffset.y = 120
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
    
    

}
