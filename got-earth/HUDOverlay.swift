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
    var settingsButton: SKSpriteNode!
    var parentViewController: UIViewController!
    
    init(size: CGSize, parentViewController: UIViewController) {
        super.init(size: size)
        
        self.parentViewController = parentViewController
        
        let halfPosX = self.size.width / 2
        let posY = CGFloat(20)
        
        self.appTitle = SKLabelNode(fontNamed: "GodOfWar")
        appTitle.fontSize = 18
        appTitle.position.x = halfPosX
        appTitle.position.y = posY
        appTitle.color = UIColor.white
        appTitle.text = "GOT Earth"
        
        self.settingsButton = SKSpriteNode(imageNamed: Bundle.main.path(forResource: "settings", ofType: "png")!)
        settingsButton.position.x = CGFloat(30)
        settingsButton.position.y = posY + CGFloat(10)
        settingsButton.name = "settings"
        
        self.addChild(appTitle)
        self.addChild(settingsButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let positionInScene = touch.location(in: self)
            let touchedNode = self.atPoint(positionInScene)
            if let name = touchedNode.name {
                if name == "settings" {
                    let settingsViewController = SettingsViewController()
                    self.parentViewController.present(settingsViewController, animated: true, completion: nil)
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
