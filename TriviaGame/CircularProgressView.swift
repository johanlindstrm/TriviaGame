//
//  CircularProgressView.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-02-09.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit

class CircularProgressView: UIView {

    var progressLayer = CAShapeLayer()
    var trackLayer = CAShapeLayer()
    
    var progressColor = UIColor.white {
       didSet {
          progressLayer.strokeColor = progressColor.cgColor
       }
    }
    var trackColor = UIColor.white {
       didSet {
          trackLayer.strokeColor = trackColor.cgColor
       }
    }
    
    func makeCircularPath() {
       self.backgroundColor = UIColor.clear
       self.layer.cornerRadius = self.frame.size.width/2
       let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
        
       trackLayer.path = circlePath.cgPath
       trackLayer.fillColor = UIColor.clear.cgColor
       trackLayer.strokeColor = trackColor.cgColor
       trackLayer.lineWidth = 10.0
       trackLayer.strokeEnd = 1.0
       layer.addSublayer(trackLayer)
        
       progressLayer.path = circlePath.cgPath
       progressLayer.fillColor = UIColor.clear.cgColor
       progressLayer.strokeColor = progressColor.cgColor
       progressLayer.lineWidth = 10.0
       progressLayer.strokeEnd = 0.0
       layer.addSublayer(progressLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       makeCircularPath()
    }
    
    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.add(animation, forKey: "animateProgress")
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
