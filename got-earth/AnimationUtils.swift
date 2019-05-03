//
//  AnimationUtils.swift
//  GOT Earth
//
//  Created by Ian Bastos on 17/04/2019.
//  Copyright © 2019 Ian Bastos. All rights reserved.
//

import UIKit
import SceneKit

class AnimationUtils: NSObject {

    static func zoomIn(sceneObject: SCNNode, to: Float, duration: Double, callback: (() -> Void)? = nil) {
        SCNTransaction.begin()
        SCNTransaction.animationDuration = duration
        sceneObject.position.z = to
        
        if (callback != nil) {
            SCNTransaction.completionBlock = callback
        }
        
        SCNTransaction.commit()
    }
    
}
