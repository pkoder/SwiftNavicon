//
//  Navicon.swift
//  Pods
//
//  Created by Poakong Heng on 11/09/2015.
//
//

import UIKit

open class Navicon: UIButton {
    
    let animationLength = 0.5
    let kTouchSize: CGFloat = 40.0
    
    var topLayer = CALayer()
    var midLayer = CALayer()
    var botLayer = CALayer()
    var containerLayer = CALayer()
    
    var topPosition = CGPoint()
    var midPosition = CGPoint()
    var botPosition = CGPoint()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        containerLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        self.layer.addSublayer(containerLayer)
        
        let myBounds = CGRect(x: 0.0, y: 0.0, width: self.bounds.width - 5, height: self.bounds.height/10)
        let cornerRadius = myBounds.height/2
        
        topPosition = CGPoint(x: self.bounds.width/2, y: self.bounds.height/4)
        
        topLayer.bounds = myBounds
        topLayer.cornerRadius = cornerRadius
        topLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        topLayer.position = topPosition
        
        containerLayer.addSublayer(topLayer)
        
        midPosition = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
        
        midLayer.bounds = myBounds
        midLayer.cornerRadius = cornerRadius
        midLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        midLayer.position = midPosition
        
        containerLayer.addSublayer(midLayer)
        
        botPosition = CGPoint(x: self.bounds.width/2, y: topLayer.position.y * 3)
        
        botLayer.bounds = myBounds
        botLayer.cornerRadius = cornerRadius
        botLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        botLayer.position = botPosition
        
        containerLayer.addSublayer(botLayer)
        
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        containerLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.layer.addSublayer(containerLayer)
        
        let myBounds = CGRect(x: 0.0, y: 0.0, width: self.frame.width - 5, height: self.frame.height/10)
        let cornerRadius = myBounds.height/2
        
        topPosition = CGPoint(x: self.frame.width/2, y: self.frame.height/4)
        
        topLayer.bounds = myBounds
        topLayer.cornerRadius = cornerRadius
        topLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        topLayer.position = topPosition
        
        containerLayer.addSublayer(topLayer)
        
        midPosition = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        
        midLayer.bounds = myBounds
        midLayer.cornerRadius = cornerRadius
        midLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        midLayer.position = midPosition
        
        containerLayer.addSublayer(midLayer)
        
        botPosition = CGPoint(x: self.frame.width/2, y: topLayer.position.y * 3)
        
        botLayer.bounds = myBounds
        botLayer.cornerRadius = cornerRadius
        botLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        botLayer.position = botPosition
        
        containerLayer.addSublayer(botLayer)
        
    }
    
    //MARK: Override Touch Events
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }, completion: { (Bool) -> Void in
                super.touchesBegan(touches, with: event)
        }) 
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 6.0,
            options: UIViewAnimationOptions.allowUserInteraction,
            animations: { () -> Void in
                self.transform = CGAffineTransform.identity
            }) { (Bool) -> Void in
                super.touchesEnded(touches, with: event)
        }
        
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        if ((touchLocation.x >= 0.0) && (touchLocation.x <= kTouchSize) && (touchLocation.y >= 0.0) && (touchLocation.y <= kTouchSize)) {
            self.sendActions(for: UIControlEvents.touchUpInside)
        }
    }
    
    
    //MARK: Animation Methods
    
    open func transformCross(animated: Bool) {
        
        if (!animated)
        {
            crossTransform()
            return
        }
        
        UIView.animate(withDuration: animationLength, animations: { () -> Void in
            self.crossTransform()
            }, completion: nil)
    }
    
    open func transformReset(animated: Bool) {
        
        if (!animated)
        {
            resetTransform()
            return
        }
        
        UIView.animate(withDuration: animationLength, animations: { () -> Void in
            self.resetTransform()
            }, completion: nil)
    }
    
    open func transformRotate(animated: Bool) {
        if (!animated)
        {
            rotateTransform()
            return
        }
        
        UIView.animate(withDuration: animationLength, animations: { () -> Void in
            self.rotateTransform()
            }, completion: nil)
    }
    
    //MARK: Transforms and Property Manipulations
    
    func crossTransform() {
        self.topLayer.opacity = 1.0
        self.midLayer.opacity = 0.0
        self.botLayer.opacity = 1.0
        
        self.topLayer.position = midPosition
        self.midLayer.position = midPosition
        self.botLayer.position = midPosition
        
        self.topLayer.transform = CATransform3DMakeRotation(CGFloat(-M_PI_4), 0.0, 0.0, 1.0)
        self.midLayer.transform = CATransform3DMakeRotation(0.0, 0.0, 0.0, 1.0)
        self.botLayer.transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0.0, 0.0, 1.0)
    }
    
    func resetTransform() {
        self.topLayer.opacity = 1.0
        self.midLayer.opacity = 1.0
        self.botLayer.opacity = 1.0
        
        self.topLayer.position = topPosition
        self.midLayer.position = midPosition
        self.botLayer.position = botPosition
        
        self.containerLayer.transform = CATransform3DMakeRotation(0.0, 0.0, 0.0, 1.0)
        
        self.topLayer.transform = CATransform3DMakeRotation(0.0, 0.0, 0.0, 1.0)
        self.midLayer.transform = CATransform3DMakeRotation(0.0, 0.0, 0.0, 1.0)
        self.botLayer.transform = CATransform3DMakeRotation(0.0, 0.0, 0.0, 1.0)
        
        self.layer.transform = CATransform3DMakeRotation(0.0, 0.0, 0.0, 1.0)
        
    }
    
    func rotateTransform() {
        self.containerLayer.transform = CATransform3DMakeRotation(CGFloat(-M_PI_2), 0.0, 0.0, 1.0)
    }
}
