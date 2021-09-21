//
//  AnimationProperties.swift
//  ShowMeAnimation
//
//  Created by Vladimir Izmaylov on 22.09.2021.
//

import Foundation

struct AnimationProperties {
    var preset: String
    var curve: String
    var force: Double
    var duration: Double
    var delay: Double

    func showAnimationProperties() -> AnimationProperties {
        var randomAnimation: AnimationProperties!
        
        randomAnimation.preset = DataManager.shared.animationPresets.randomElement() ?? ""
        randomAnimation.curve = DataManager.shared.animationCurves.randomElement() ?? ""
        randomAnimation.force = Double.random(in: 0.1...2.0)
        randomAnimation.duration = Double.random(in: 0.1...2.0)
        randomAnimation.delay = Double.random(in: 0.1...2.0)
        
        return randomAnimation
        
        }
    
}

