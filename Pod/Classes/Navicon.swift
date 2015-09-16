//
//  Navicon.swift
//  Pods
//
//  Created by Poakong Heng on 11/09/2015.
//
//

import UIKit

public class Navicon: UIButton {
    
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
        
        containerLayer.frame = CGRectMake(0, 0, self.bounds.width, self.bounds.height)
        self.layer.addSublayer(containerLayer)
        
        let myBounds = CGRect(x: 0.0, y: 0.0, width: self.bounds.width - 5, height: self.bounds.height/10)
        let cornerRadius = myBounds.height/2
        
        topPosition = CGPoint(x: self.bounds.width/2, y: self.bounds.height/4)
        
        topLayer.bounds = myBounds
        topLayer.cornerRadius = cornerRadius
        topLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).CGColor
        topLayer.position = topPosition
        
        containerLayer.addSublayer(topLayer)
        
        midPosition = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
        
        midLayer.bounds = myBounds
        midLayer.cornerRadius = cornerRadius
        midLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).CGColor
        midLayer.position = midPosition
        
        containerLayer.addSublayer(midLayer)
        
        botPosition = CGPoint(x: self.bounds.width/2, y: topLayer.position.y * 3)
        
        botLayer.bounds = myBounds
        botLayer.cornerRadius = cornerRadius
        botLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).CGColor
        botLayer.position = botPosition
        
        containerLayer.addSublayer(botLayer)
        
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        containerLayer.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        self.layer.addSublayer(containerLayer)
        
        let myBounds = CGRect(x: 0.0, y: 0.0, width: self.frame.width - 5, height: self.frame.height/10)
        let cornerRadius = myBounds.height/2
        
        topPosition = CGPoint(x: self.frame.width/2, y: self.frame.height/4)
        
        topLayer.bounds = myBounds
        topLayer.cornerRadius = cornerRadius
        topLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).CGColor
        topLayer.position = topPosition
        
        containerLayer.addSublayer(topLayer)
        
        midPosition = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        
        midLayer.bounds = myBounds
        midLayer.cornerRadius = cornerRadius
        midLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).CGColor
        midLayer.position = midPosition
        
        containerLayer.addSublayer(midLayer)
        
        botPosition = CGPoint(x: self.frame.width/2, y: topLayer.position.y * 3)
        
        botLayer.bounds = myBounds
        botLayer.cornerRadius = cornerRadius
        botLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).CGColor
        botLayer.position = botPosition
        
        containerLayer.addSublayer(botLayer)
        
    }
    
    //MARK: Override Touch Events
    
    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.transform = CGAffineTransformMakeScale(0.8, 0.8)
            }) { (Bool) -> Void in
                super.touchesBegan(touches, withEvent: event)
        }
    }
    
    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(0.5,
            delay: 0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 6.0,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: { () -> Void in
                self.transform = CGAffineTransformIdentity
            }) { (Bool) -> Void in
                super.touchesEnded(touches, withEvent: event)
        }
        
        let touch = touches.first
        let touchLocation = touch!.locationInView(self)
        if ((touchLocation.x >= 0.0) && (touchLocation.x <= kTouchSize) && (touchLocation.y >= 0.0) && (touchLocation.y <= kTouchSize)) {
            self.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
        }
    }
    
    
    //MARK: Animation Methods
    
    public func transformCross(animated animated: Bool) {
        
        if (!animated)
        {
            crossTransform()
            return
        }
        
        UIView.animateWithDuration(animationLength, animations: { () -> Void in
            self.crossTransform()
            }, completion: nil)
    }
    
    public func transformReset(animated animated: Bool) {
        
        if (!animated)
        {
            resetTransform()
            return
        }
        
        UIView.animateWithDuration(animationLength, animations: { () -> Void in
            self.resetTransform()
            }, completion: nil)
    }
    
    public func transformRotate(animated animated: Bool) {
        if (!animated)
        {
            rotateTransform()
            return
        }
        
        UIView.animateWithDuration(animationLength, animations: { () -> Void in
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
