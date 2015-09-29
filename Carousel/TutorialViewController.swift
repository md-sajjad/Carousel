//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Muddassar Sajjad on 9/28/15.
//  Copyright (c) 2015 com.training.codepath. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var imageTakeCarouselForASpin: UIImageView!
    
    
    @IBAction func onTakeForASpin(sender: AnyObject) {
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        //imageTakeCarouselForASpin.alpha = 0
        print(page)
        print(" x ")
        print(imageTakeCarouselForASpin.alpha)
        if(page == 3) {
            
            imageTakeCarouselForASpin.alpha = 1

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageTakeCarouselForASpin.alpha = 0
        
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(1280, 568)

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
