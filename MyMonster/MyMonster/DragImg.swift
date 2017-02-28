//
//  DragImg.swift
//  MyMonster
//
//  Created by Indra Gunawan on 28/2/17.
//  Copyright © 2017 MyLab Inc. All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView {
    
    var originalPoint: CGPoint!
    var dropTarget: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        originalPoint = self.center
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self.superview)
            self.center = CGPoint(x: position.x, y: position.y)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let target = dropTarget {
            let position = touch.location(in: self.superview)
            
            if target.frame.contains(position) {
                NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "onTargetDropped"), object:nil))
            }
        }
        
        self.center = originalPoint
    }

}
