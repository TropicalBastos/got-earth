//
//  HUDOverlay.swift
//  GOT Earth
//
//  Created by Ian Bastos on 23/04/2019.
//  Copyright © 2019 Ian Bastos. All rights reserved.
//

import Foundation
import SpriteKit

class HUDOverlay : SKScene {
    
    var appTitle: SKLabelNode!
    
    override init(size: CGSize) {
        super.init(size: size)
        
        let halfPosX = self.size.width / 2
        let posY = CGFloat(20)
        
        self.appTitle = SKLabelNode(fontNamed: "GodOfWar")
        appTitle.fontSize = 18
        appTitle.position.x = halfPosX
        appTitle.position.y = posY
        appTitle.color = UIColor.white
        appTitle.text = "GOT Earth"
        
        self.addChild(appTitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
