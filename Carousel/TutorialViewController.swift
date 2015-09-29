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
    
    @IBOutlet weak var buttonTakeCarouselForASpin: UIButton!
    
    @IBAction func onTakeForASpin(sender: AnyObject) {
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page

        print(page)
        print(" x ")
        print(imageTakeCarouselForASpin.alpha)

        
        if (page == 3) {
            UIView.animateWithDuration(0.7, animations: {
                self.pageControl.alpha = 0;
                self.imageTakeCarouselForASpin.alpha = 1;
                self.buttonTakeCarouselForASpin.alpha = 1;
            })
        } else {
            UIView.animateWithDuration(0.7, animations: {
                self.pageControl.alpha = 1;
                self.imageTakeCarouselForASpin.alpha = 0;
                self.buttonTakeCarouselForASpin.alpha = 0;
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
