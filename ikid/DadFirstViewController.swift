//
//  DadFirstViewController.swift
//  ikid
//
//  Created by Kevin Tran on 2/4/18.
//  Copyright © 2018 Kevin Tran. All rights reserved.
//

import UIKit

class DadFirstViewController: UIViewController {
    
    @IBOutlet weak var dadText: UILabel!
    @IBOutlet weak var dadButton: UIButton!
    
    fileprivate var dadFirstViewController : DadFirstViewController!
    fileprivate var dadSecondViewController : DadSecondViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstDadBuilder()
        secondDadBuilder()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func firstDadBuilder() {
        if dadFirstViewController == nil {
            dadFirstViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "FirstDad")
                as! DadFirstViewController
        }
    }
    fileprivate func secondDadBuilder() {
        if dadSecondViewController == nil {
            dadSecondViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "SecondDad")
                as! DadSecondViewController
        }
    }
    
    @IBAction func switchView(_ sender: UIButton) {
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if dadFirstViewController != nil &&
            dadFirstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            dadSecondViewController.view.frame = view.frame
            switchViewController(dadFirstViewController, to: dadSecondViewController)
            dadText.isHidden = true
            dadButton.setTitle("Back", for: .normal)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            dadFirstViewController.view.frame = view.frame
            switchViewController(dadSecondViewController, to: dadFirstViewController)
            dadText.isHidden = false
            dadButton.setTitle("Next", for: .normal)
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

