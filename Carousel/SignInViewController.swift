//
//  SignInViewController.swift
//  Carousel
//
//  Created by Muddassar Sajjad on 9/27/15.
//  Copyright (c) 2015 com.training.codepath. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var activityIndicatorSignIn: UIActivityIndicatorView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var signInButtonView: UIView!
    
    var signInViewInitialY: CGFloat = 0.0
    var singInOffset: CGFloat = 250
    var scrollOffset: CGFloat = 85
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        signInViewInitialY = signInButtonView.center.y
    }

    @IBAction func onSignIn(sender: AnyObject)
    {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        
        if emailTextField.text!.isEmpty && passwordTextField.text!.isEmpty
        {
            presentOKAlert("Email & Password are empty!")
        }
        else if emailTextField.text!.isEmpty
        {
            presentOKAlert("Email is empty!")
        }
        else if passwordTextField.text!.isEmpty
        {
            presentOKAlert("Password is empty!")
        }
        else {
            activityIndicatorSignIn.startAnimating()
            delay(3)
            {
                self.activityIndicatorSignIn.stopAnimating()
                if (self.emailTextField.text != "u" || self.passwordTextField.text != "p")
                {
                    self.presentOKAlert("Email and/or Password combination is invalid")
                }
                else {
                    let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("TutorialViewController")
                    self.showViewController(vc as! UIViewController, sender: vc)
                }
            }
        }
    }
    
    func presentOKAlert(alertMessage : String) {
        let alertController = UIAlertController(title: "Incorrect Credentials", message: alertMessage, preferredStyle: .Alert)
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // handle response here.
        }
        alertController.addAction(OKAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        //SubLoginView.center.y -= offset
        animateKeyboardShow(notification)
    }
    
    func animateKeyboardHide(notification: NSNotification!)
    {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.4, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.signInButtonView.center.y = self.signInViewInitialY
            self.scrollView.contentOffset = CGPoint(x: 0, y: 0)

            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
    
    func animateKeyboardShow(notification: NSNotification!)
    {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.4, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.signInButtonView.center.y = self.signInViewInitialY - self.singInOffset
            self.scrollView.contentOffset = CGPoint(x: 0, y: self.scrollOffset)

            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        //SubLoginView.center.y = initialY
        animateKeyboardHide(notification)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
