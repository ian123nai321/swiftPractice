//
//  ViewController.swift
//  Practice手勢
//
//  Created by 吳政緯 on 2016/12/16.
//  Copyright © 2016年 吳政緯. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    var imageView: UIImageView!
    var anotherUIView :UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView = UIImageView()
        self.imageView.image = #imageLiteral(resourceName: "Mario")
        self.imageView.isUserInteractionEnabled = true
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        //MARK : Constraints
        let widthConstraint = NSLayoutConstraint.init(item: self.imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        let heightConstraint = NSLayoutConstraint.init(item: self.imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        let xConstraint = NSLayoutConstraint.init(item: self.imageView, attribute: .centerX  , relatedBy: .equal, toItem: self.view, attribute: .centerX , multiplier: 1.0, constant: 0)
        let yConstraint = NSLayoutConstraint.init(item: self.imageView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([widthConstraint,heightConstraint,xConstraint,yConstraint])
        
        let rotateGuesture = UIRotationGestureRecognizer.init(target: self, action: #selector(ViewController.rotate(guesture:)))
        let panGuesture = UIPanGestureRecognizer.init(target: self, action: #selector(ViewController.pan(guesture:)))
        let pinchGuesture = UIPinchGestureRecognizer.init(target: self, action: #selector(ViewController.pinch(guesture:)))
        
        let guestures : [UIGestureRecognizer] = [rotateGuesture,panGuesture,pinchGuesture]
        for guesture in guestures{
            self.imageView.addGestureRecognizer(guesture)
        }
}
        func rotate (guesture: UIRotationGestureRecognizer){
            if let guestureView = guesture.view{
                guestureView.transform = CGAffineTransform.init(rotationAngle: guesture.rotation)
            }
            
        }
        func pan (guesture: UIPanGestureRecognizer){
            let translation = guesture.translation(in: self.view)
            if let guestureView = guesture.view{
                guestureView.center = CGPoint(x:guestureView.center.x + translation.x , y: guestureView.center.y + translation.y)
                guesture.setTranslation(CGPoint.zero, in: self.view)
            }
        }
        func pinch(guesture: UIPinchGestureRecognizer){
            if let guestureView = guesture.view{
                guestureView.transform = CGAffineTransform.init(scaleX: guesture.scale,y: guesture.scale )
            }
        }

        
        
        
        
        
        
        
        
        
        
        
    
    
}

    
    
    
    
    
    
    
    
    
    
    
    
    


