//
//  DadViewController.swift
//  ikid
//
//  Created by Kevin Tran on 2/5/18.
//  Copyright © 2018 Kevin Tran. All rights reserved.
//

import UIKit

class DadViewController: UIViewController {

    @IBOutlet weak var dadText: UILabel!
    @IBOutlet weak var dadButton: UIButton!
    
    fileprivate var dadViewController : DadViewController!
    fileprivate var flipped = false;
    fileprivate var jokeBank : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeBank.append("A pie costs $2.50 in Jamaica, $3.00 in Cuba, and $3.50 in Barbados")
        jokeBank.append("These are the pie rates of the Caribbean")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchView(_ sender: UIButton) {
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if flipped == false {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            dadText.text = jokeBank[0]
            dadButton.setTitle("Next", for: .normal)
            flipped = !flipped
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            dadText.text = jokeBank[1]
            flipped = !flipped
            dadButton.setTitle("Back", for: .normal)
        }
        UIView.commitAnimations()
    }
}
