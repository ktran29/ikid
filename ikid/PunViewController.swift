//
//  PunViewController.swift
//  ikid
//
//  Created by Kevin Tran on 2/5/18.
//  Copyright © 2018 Kevin Tran. All rights reserved.
//

import UIKit

class PunViewController: UIViewController {

    @IBOutlet weak var punText: UILabel!
    @IBOutlet weak var punButton: UIButton!
    
    fileprivate var punViewController : PunViewController!
    fileprivate var flipped = false;
    fileprivate var jokeBank : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeBank.append("Why is leather armor perfect for sneaking?")
        jokeBank.append("Because it's made of hide")
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
            punText.text = jokeBank[0]
            punButton.setTitle("Next", for: .normal)
            flipped = !flipped
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            punText.text = jokeBank[1]
            flipped = !flipped
            punButton.setTitle("Back", for: .normal)
        }
        UIView.commitAnimations()
    }
}
