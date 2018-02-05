//
//  GoodFirstViewController.swift
//  ikid
//
//  Created by Kevin Tran on 2/4/18.
//  Copyright © 2018 Kevin Tran. All rights reserved.
//

import UIKit

class GoodFirstViewController: UIViewController {
    
    @IBOutlet weak var goodText: UILabel!
    
    fileprivate var goodFirstViewController : GoodFirstViewController!
    fileprivate var goodSecondViewController : GoodSecondViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstGoodBuilder()
        secondGoodBuilder()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func firstGoodBuilder() {
        if goodFirstViewController == nil {
            goodFirstViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "FirstGood")
                as! GoodFirstViewController
        }
    }
    fileprivate func secondGoodBuilder() {
        if goodSecondViewController == nil {
            goodSecondViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "SecondGood")
                as! GoodSecondViewController
        }
    }
    
    @IBAction func switchView(_ sender: UIButton) {
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if goodFirstViewController != nil &&
            goodFirstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            goodSecondViewController.view.frame = view.frame
            switchViewController(goodFirstViewController, to: goodSecondViewController)
            goodText.isHidden = true
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            goodFirstViewController.view.frame = view.frame
            switchViewController(goodSecondViewController, to: goodFirstViewController)
            goodText.isHidden = false
        }
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
            
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }
    
    
}


