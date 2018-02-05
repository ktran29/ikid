//
//  PunFirstViewController.swift
//  ikid
//
//  Created by Kevin Tran on 2/4/18.
//  Copyright © 2018 Kevin Tran. All rights reserved.
//

import UIKit

class PunFirstViewController: UIViewController {
    @IBOutlet weak var punText: UILabel!
    
    fileprivate var punFirstViewController : PunFirstViewController!
    fileprivate var punSecondViewController : PunSecondViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstPunBuilder()
        secondPunBuilder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func firstPunBuilder() {
        if punFirstViewController == nil {
            punFirstViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "FirstPun")
                as! PunFirstViewController
        }
    }
    fileprivate func secondPunBuilder() {
        if punSecondViewController == nil {
            punSecondViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "SecondPun")
                as! PunSecondViewController
        }
    }
    
    
    @IBAction func switchPunView(_ sender: UIButton) {
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if punFirstViewController != nil &&
            punFirstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
//            punSecondViewController.view.frame = view.frame
            switchViewController(punFirstViewController, to: punSecondViewController)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
//            punFirstViewController.view.frame = view.frame
            switchViewController(punSecondViewController, to: punFirstViewController)
        }
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
            if from == punFirstViewController {
                punText.isHidden = true
            } else {
                punText.isHidden = false
            }
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }

    
}
