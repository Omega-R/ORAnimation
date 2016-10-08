//
//  ORAnimation.swift
//  Pods
//
//  Created by Maxim Soloviev on 21/06/16.
//  Copyright © 2016 Maxim Soloviev. All rights reserved.
//

import QuartzCore

@objc open class ORAnimation: NSObject {
    
    @objc open static func circularMaskAnimation(destinationRect: CGRect, duration: CFTimeInterval) -> CABasicAnimation {
        let destinationCirclePath = UIBezierPath(ovalIn: destinationRect).cgPath
        
        let anim = CABasicAnimation(keyPath: "path")
        anim.toValue = destinationCirclePath
        anim.duration = duration
        anim.repeatCount = 0
        anim.autoreverses = false
        anim.isRemovedOnCompletion = false
        anim.fillMode = kCAFillModeForwards
        
        return anim
    }
    
    @objc open static func addCircularMaskAnimation(initialRect: CGRect, destinationRect: CGRect, duration: CFTimeInterval, toView view: UIView) {
        let anim = circularMaskAnimation(destinationRect: destinationRect, duration: duration)
        
        let initialCirclePath = UIBezierPath(ovalIn: initialRect).cgPath
        
        let mask = CAShapeLayer()
        mask.path = initialCirclePath
        mask.backgroundColor = UIColor.black.cgColor
        
        view.layer.mask = mask
        mask.add(anim, forKey: "path")
    }
    
    @objc open static func removeMaskFromView(_ view: UIView) {
        view.layer.mask = nil
    }
    
    @objc open static func addPulseAnimationToView(_ v: UIView, toScaleValue: CGFloat, toScaleDuration: CFTimeInterval, fromScaleDuration: CFTimeInterval, timeout: CFTimeInterval = 0, repeatCount: Float = HUGE, animKey: String = "pulse") {
        let animScaleUp = CABasicAnimation(keyPath: "transform.scale")
        animScaleUp.autoreverses = false
        animScaleUp.fromValue = 1
        animScaleUp.toValue = toScaleValue
        animScaleUp.duration = toScaleDuration
        animScaleUp.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animScaleUp.beginTime = 0
        animScaleUp.repeatCount = 1
        animScaleUp.fillMode = kCAFillModeForwards
        
        let animScaleDown = CABasicAnimation(keyPath: "transform.scale")
        animScaleDown.autoreverses = false
        animScaleDown.fromValue = toScaleValue
        animScaleDown.toValue = 1
        animScaleDown.duration = fromScaleDuration
        animScaleDown.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animScaleDown.beginTime = animScaleUp.duration
        animScaleDown.repeatCount = 1
        animScaleDown.fillMode = kCAFillModeForwards
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [animScaleUp, animScaleDown]
        animGroup.duration = animScaleDown.beginTime + animScaleDown.duration + timeout
        animGroup.repeatCount = repeatCount
        
        v.layer.add(animGroup, forKey: animKey)
    }
}
