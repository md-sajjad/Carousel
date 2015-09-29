//
//  TimelineViewController.swift
//  Carousel
//
//  Created by Muddassar Sajjad on 9/29/15.
//  Copyright (c) 2015 com.training.codepath. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageFeed: UIImageView!
    
    @IBOutlet weak var onSettings: UIButton!
    
    @IBAction func onSettings(sender: AnyObject) {
        print("Settings Pressed")
    }
    
    @IBAction func onConversations(sender: AnyObject) {
        print("Conversations Pressed")
        let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("ConversationsViewController")
        self.showViewController(vc as! UIViewController, sender: vc)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageFeed.image!.size
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
