//
//  ViewController.swift
//  ShowMeAnimation
//
//  Created by Vladimir Izmaylov on 22.09.2021.
//

import Spring

class ViewController: UIViewController {
    
    var firstAnimation = AnimationProperties()
    var randomAnimationFromButton = AnimationProperties()
    
    @IBOutlet var nameOfPresetLabel: UILabel!
    @IBOutlet var nameOfCurveLabel: UILabel!
    @IBOutlet var valueOfForceLabel: UILabel!
    @IBOutlet var valueOfDurationLabel: UILabel!
    @IBOutlet var valueOfDelayLabel: UILabel!
    
    @IBOutlet var animationView: SpringView!
    @IBOutlet var runAnimationButton: SpringButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstAnimation = getRandomAnimation()
        animationView.layer.cornerRadius = 20
        runAnimationButton.layer.cornerRadius = 5
        getValuesForLabels(setAnimation: firstAnimation)
    }

    @IBAction func runAnimationButton(_ sender: SpringButton) {
        
        if runAnimationButton.titleLabel?.text == "Run" {
            
            randomAnimationFromButton = getRandomAnimation()
            
            animationView.animation = firstAnimation.preset
            animationView.curve = firstAnimation.curve
            animationView.force = firstAnimation.force
            animationView.duration = firstAnimation.duration
            animationView.delay = firstAnimation.delay

            runAnimationButton.setTitle("Run \(randomAnimationFromButton.preset)", for: .normal)
            
            animationView.animate()
            
        } else {
            
            animationView.animation = randomAnimationFromButton.preset
            animationView.curve = randomAnimationFromButton.curve
            animationView.force = randomAnimationFromButton.delay
            animationView.duration = randomAnimationFromButton.duration
            animationView.delay = randomAnimationFromButton.delay
            
            getValuesForLabels(setAnimation: randomAnimationFromButton)
            
            randomAnimationFromButton = getRandomAnimation()
            
            runAnimationButton.setTitle("Run \(randomAnimationFromButton.preset)", for: .normal)
            
            

        
        animationView.animate()
    }
    
        
}
    private func getRandomAnimation() -> AnimationProperties {
        var animationValues = AnimationProperties()
        animationValues.preset = Spring.AnimationPreset.allCases.randomElement()?.rawValue ?? ""
        animationValues.curve = Spring.AnimationCurve.allCases.randomElement()?.rawValue ?? ""
        animationValues.force = CGFloat.random(in: 1...20)
        animationValues.duration = CGFloat.random(in: 0.5...1)
        animationValues.delay = CGFloat.random(in: 0.05...0.3)
        return animationValues
    }

    private func getValuesForLabels(setAnimation: AnimationProperties) {
        let valueForLabels = setAnimation
        nameOfPresetLabel.text = "Preset: \(valueForLabels.preset)"
        nameOfCurveLabel.text = "Curve: \(valueForLabels.curve)"
        valueOfForceLabel.text = "Force: " + String(format: "%.2f", valueForLabels.force)
        valueOfDurationLabel.text = "Duration: " + String(format: "%.2f", valueForLabels.duration)
        valueOfDelayLabel.text = "Delay " + String(format: "%.2f", valueForLabels.delay)
    }
}
