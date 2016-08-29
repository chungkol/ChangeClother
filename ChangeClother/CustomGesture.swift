//
//  CustomGesture.swift
//  ChangeClother
//
//  Created by Chung on 8/29/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import Foundation
import UIKit

class CustomGesture: UIImageView , UIGestureRecognizerDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup(){
        self.multipleTouchEnabled = true
        self.userInteractionEnabled = true
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(CustomGesture.onPan(_:)))
        self.addGestureRecognizer(panGesture)
        
        
        
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(CustomGesture.onPinch(_:)))
        self.addGestureRecognizer(pinchGesture)
        
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(CustomGesture.onRotate(_:)))
        rotateGesture.delegate = self
        self.addGestureRecognizer(rotateGesture)

    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    func onPan(panGesture: UIPanGestureRecognizer){
        if(panGesture.state == .Began  || panGesture.state == .Changed){
            let point = panGesture.locationInView(self.superview)
            self.center = point
        }
    }
    
    
    func onPinch(pinchGesture: UIPinchGestureRecognizer){
        
        if let view = pinchGesture.view{
            view.transform = CGAffineTransformScale(view.transform, pinchGesture.scale, pinchGesture.scale)
            pinchGesture.scale = 1
            
        }
    }
    func onRotate(rotateGesture: UIRotationGestureRecognizer){
        if let view = rotateGesture.view {
            view.transform = CGAffineTransformRotate(view.transform, rotateGesture.rotation)
            rotateGesture.rotation = 0
        }
    }

}
