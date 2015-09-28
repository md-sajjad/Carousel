//
//  IntroViewController.swift
//  Carousel
//
//  Created by Muddassar Sajjad on 9/27/15.
//  Copyright (c) 2015 com.training.codepath. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var introImage: UIImageView!
    
    @IBOutlet weak var imagePic5: UIImageView!
    @IBOutlet weak var imagePic6: UIImageView!
    @IBOutlet weak var imagePic3: UIImageView!
    @IBOutlet weak var imagePic1: UIImageView!
    @IBOutlet weak var imagePic4: UIImageView!
    @IBOutlet weak var imagePic2: UIImageView!
    
    let initialSide: CGFloat = 135
    let horizontalOverlap: CGFloat = 45
    let verticalOverlap: CGFloat = 30
    let rightRotate = CGFloat(10 * M_PI / 180)
    let leftRotate = CGFloat(-10 * M_PI / 180)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        scrollView.contentSize = introImage.image!.size
        
        scrollView.delegate = self
        
        imagePic5.frame = CGRectMake(0.0,0.0,initialSide,initialSide)
        imagePic6.frame = CGRectMake(0.0+initialSide-horizontalOverlap,0.0,initialSide,initialSide)
        imagePic3.frame = CGRectMake(0.0+2*initialSide-2*horizontalOverlap,0.0,initialSide,initialSide)
        
        imagePic1.frame = CGRectMake(0.0,0.0+initialSide-verticalOverlap,initialSide,initialSide)
        imagePic4.frame = CGRectMake(0.0+initialSide-horizontalOverlap,0.0+initialSide-verticalOverlap,initialSide,initialSide)
        imagePic2.frame = CGRectMake(0.0+2*initialSide-2*horizontalOverlap,0.0+initialSide-verticalOverlap,initialSide,initialSide)
        
        
        imagePic5.transform = CGAffineTransformMakeRotation(rightRotate)
        
        imagePic6.transform = CGAffineTransformMakeRotation(leftRotate)

        imagePic3.transform = CGAffineTransformMakeRotation(rightRotate)

        imagePic1.transform = CGAffineTransformMakeRotation(leftRotate)
        
        imagePic4.transform = CGAffineTransformMakeRotation(rightRotate)
        
        imagePic2.transform = CGAffineTransformMakeRotation(leftRotate)

        // 563
        // 142
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        //print(scrollView.center.x);
        //print(scrollView.center.y);
        
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
