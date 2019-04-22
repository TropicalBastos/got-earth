//
//  MainViewController.swift
//  GOT Earth
//
//  Created by Ian Bastos on 16/04/2019.
//  Copyright © 2019 Ian Bastos. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class MainViewController: UIViewController {
    
    var scene: SCNScene!
    var cameraNode: SCNNode!
    var cameraOrbit: SCNNode!
    var lightOrbit: SCNNode!
    var lastWidthRatio: CGFloat! = 0
    var lastHeightRatio: CGFloat! = 0
    var globe: SCNNode!
    var lastScaleFactor: CGFloat = 0
    var zoomInComplete: Bool = false
    var detailsController: DetailsViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        self.scene = SCNScene(named: "art.scnassets/gotearth-scene.scn")!
        
        // create and add a camera to the scene
        self.cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.zFar = 200
        cameraNode.name = "Camera"
        cameraOrbit = SCNNode()
        cameraOrbit.addChildNode(cameraNode)
        scene.rootNode.addChildNode(cameraOrbit)

        // place the camera
        self.globe = scene.rootNode.childNode(withName: "Globe", recursively: true)!
        cameraOrbit.position = globe.position
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 100)
        AnimationUtils.zoomIn(sceneObject: cameraNode, to: 20, duration: 5, callback: {
            self.zoomInComplete = true
        })
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        self.lightOrbit = SCNNode()
        lightOrbit.position = cameraOrbit.position
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 30, z: 60)
        lightOrbit.addChildNode(lightNode)
        scene.rootNode.addChildNode(lightOrbit)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = false
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.black
        
        // add a tap gesture recognizer
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        scnView.addGestureRecognizer(panGesture)
        scnView.addGestureRecognizer(pinchGesture)
        scnView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        let widthRatio = (translation.x / self.view.frame.size.width) + lastWidthRatio
        let heightRatio = (translation.y / self.view.frame.size.height) + lastHeightRatio
        
        var eulerY = Float(-2 * Double.pi) * Float(widthRatio)
        var eulerX = Float(-Double.pi) * Float(heightRatio)
        
        if (cameraNode.position.z < 20) {
            eulerY = eulerY * 0.5
            eulerX = eulerX * 0.5
        }
        
        self.cameraOrbit.eulerAngles.y = eulerY
        self.cameraOrbit.eulerAngles.x = eulerX
        self.lightOrbit.eulerAngles.y = eulerY
        self.lightOrbit.eulerAngles.x = eulerX
        
        if (gesture.state == .ended) {
            self.lastWidthRatio = widthRatio
            self.lastHeightRatio = heightRatio
        }
    }
    
    @objc
    func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        
        if (gesture.state == .began) {
            lastScaleFactor = 1.0
        }
        
        let scale = 1.0 - (lastScaleFactor - gesture.scale)
        lastScaleFactor = scale

        // if scale is more than one then we're zooming in
        if (scale > 1) {
            cameraNode.position.z -= Float(scale)
        }
        
        // else if its less than one we're zooming out
        if (scale < 1) {
            cameraNode.position.z += Float(scale)
        }
        
        if (cameraNode.position.z < 10) {
            cameraNode.position.z = 10
        }
        
        if (cameraNode.position.z >= 100 && zoomInComplete) {
            cameraNode.position.z = 100
        }
        
        return
    }
    
    @objc
    func handleTap(_ gesture: UITapGestureRecognizer) {
        if (gesture.state == .ended) {
            let location = gesture.location(in: self.view)
            let hits = (self.view as! SCNView).hitTest(location, options: nil)
            if (!hits.isEmpty) {
                guard let tappedNode = hits.first?.node else { return }
                let bundle = StringBundle(locale: "en")
                guard let nodeWithKey = bundle.getNodeWithKey(node: tappedNode) else { return }
                let locationData = bundle.getByKey(nodeWithKey.name!) as! [String : String]

                // now switch to the details view controller
                if (self.detailsController == nil) {
                    self.detailsController = storyboard?.instantiateViewController(withIdentifier: "detailsViewController") as? DetailsViewController
                }
                
                detailsController!.locationTitleString = locationData["title"]
                detailsController!.locationDescString = locationData["description"]
                detailsController!.locationImageUri = locationData["image"]
                present(detailsController!, animated: true, completion: nil)
            }
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
