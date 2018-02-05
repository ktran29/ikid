//
//  GoodViewController.swift
//  ikid
//
//  Created by Kevin Tran on 2/5/18.
//  Copyright © 2018 Kevin Tran. All rights reserved.
//

import UIKit

class GoodViewController: UIViewController {
    
    @IBOutlet weak var goodText: UILabel!
    @IBOutlet weak var goodButton: UIButton!
    
    fileprivate var goodViewController : GoodViewController!
    fileprivate var index = 0;
    fileprivate var jokeBank : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeBank.append("Knock knock")
        jokeBank.append("Who's there?")
        jokeBank.append("Theodore!")
        jokeBank.append("Theodore who?")
        jokeBank.append("Theodore wasn't open so I knocked!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func switchView(_ sender: UIButton) {
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        if index == 0 {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            goodText.text = jokeBank[0]
            goodButton.setTitle("Next", for: .normal)
            index += 1
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            goodText.text = jokeBank[index]
            index += 1
            if (index == 5) {
                index = 0
                goodButton.setTitle("Back", for: .normal)
            }
        }
        UIView.commitAnimations()
    }
}
