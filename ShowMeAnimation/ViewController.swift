//
//  ViewController.swift
//  ShowMeAnimation
//
//  Created by Vladimir Izmaylov on 22.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var animationPropertiesLabel: UILabel!
    @IBOutlet var animationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.layer.cornerRadius = 20
        animationPropertiesLabel.text = "Hello my friend\nHow is your mood?"
    }


}

