//
//  ViewController.swift
//  ShowMeAnimation
//
//  Created by Vladimir Izmaylov on 22.09.2021.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet var nameOfPresetLabel: UILabel!
    @IBOutlet var nameOfCurveLabel: UILabel!
    @IBOutlet var valueOfForceLabel: UILabel!
    @IBOutlet var valueOfDurationLabel: UILabel!
    @IBOutlet var valueOfDelayLabel: UILabel!
    
    @IBOutlet var animationView: SpringView!
    
    @IBOutlet var runAnimationButton: SpringButton!
    
    
    func getRandomAnimation() -> AnimationProperties {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let first = getRandomAnimation()
        animationView.layer.cornerRadius = 20
        runAnimationButton.layer.cornerRadius = 5
        getValuesForLabels(setAnimation: first)
        
    }

    @IBAction func runAnimationButton(_ sender: SpringButton) {
        
        let firstAnimationFromButton = getRandomAnimation()
        let randomAnimationFromButton = getRandomAnimation()
    
        if runAnimationButton.titleLabel?.text == "Run" {
            animationView.animation = firstAnimationFromButton.preset
           animationView.curve = firstAnimationFromButton.curve
           animationView.force = firstAnimationFromButton.delay
           animationView.duration = firstAnimationFromButton.duration
           animationView.delay = firstAnimationFromButton.delay

            runAnimationButton.setTitle("Run \(firstAnimationFromButton.preset)", for: .normal)
        } else {
            
            runAnimationButton.setTitle("Run \(randomAnimationFromButton.preset)", for: .normal)
            
            animationView.animation = randomAnimationFromButton.preset
            animationView.curve = randomAnimationFromButton.curve
            animationView.force = randomAnimationFromButton.delay
            animationView.duration = randomAnimationFromButton.duration
            animationView.delay = randomAnimationFromButton.delay
            
            getValuesForLabels(setAnimation: randomAnimationFromButton)
            

        
        animationView.animate()
    }
    
}
}
