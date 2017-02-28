//
//  MonsterImg.swift
//  MyMonster
//
//  Created by Indra Gunawan on 28/2/17.
//  Copyright © 2017 MyLab Inc. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }

    func playIdleAnimation() {
        self.image = UIImage(named: "idle1.png")
        
        self.animationImages = nil
        
        var imgArr = [UIImage]()
        for x in 1...4 {
            let img = UIImage(named: "idle\(x).png")
            imgArr.append(img!)
        }
        
        self.animationImages = imgArr
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playDeathAnimation() {
        self.image = UIImage(named: "dead5.png")

        self.animationImages = nil
        
        var imgArr = [UIImage]()
        for x in 1...5 {
            let img = UIImage(named: "dead\(x).png")
            imgArr.append(img!)
        }
        
        self.animationImages = imgArr
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    
}
