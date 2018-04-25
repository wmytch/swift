//
//  ViewController.swift
//  SceneExm
//
//  Created by Mac on 2018/3/30.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit
import SceneKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sceneView=self.view as! SCNView
        sceneView.backgroundColor=UIColor.gray
        
        let scene=SCNScene()
        sceneView.scene=scene
        let camera=SCNCamera()
        camera.fieldOfView = 45
//        camera.xFov=45
//        camera.yFov=45
        let cameraNode=SCNNode()
        cameraNode.camera=camera
        cameraNode.position=SCNVector3(x:0,y:0,z:20)
        scene.rootNode.addChildNode(cameraNode)
        
        let capsule=SCNCapsule(capRadius: 2.5, height: 10)
        let capsuleNode=SCNNode(geometry: capsule)
        capsuleNode.position=SCNVector3(x:0,y:0,z:0)
        scene.rootNode.addChildNode(capsuleNode)
        
        let ambientLight=SCNLight()
        ambientLight.type=SCNLight.LightType.ambient
        ambientLight.color=UIColor(white:0.25,alpha:1.0)
        
        let ambientLightNode=SCNNode()
        ambientLightNode.light=ambientLight
        scene.rootNode.addChildNode(ambientLightNode)
        
        let omniLight=SCNLight()
        omniLight.type=SCNLight.LightType.omni
        omniLight.color=UIColor(white:1.0,alpha:1.0)
        
        let omniLightNode=SCNNode()
        omniLightNode.light=omniLight
        omniLightNode.position=SCNVector3(x:-5,y:8,z:5)
        scene.rootNode.addChildNode(omniLightNode)
        
        let moveUpDownAnimation=CABasicAnimation(keyPath: "position")
        moveUpDownAnimation.byValue=NSValue(scnVector3:SCNVector3(x:0,y:5,z:0))
        moveUpDownAnimation.timingFunction=CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        moveUpDownAnimation.autoreverses=true
        moveUpDownAnimation.repeatCount=Float.infinity
        moveUpDownAnimation.duration=2.0
        capsuleNode.addAnimation(moveUpDownAnimation, forKey: "updown")
        
        let text=SCNText(string: "SceneKit", extrusionDepth: 0.2)
        text.font=UIFont.systemFont(ofSize: 2)
        let textNode=SCNNode(geometry: text)
        textNode.position=SCNVector3(x:-2,y:6,z:0)
        capsuleNode.addChildNode(textNode)
        
        let rotate=CABasicAnimation(keyPath: "eulerAngles")
        rotate.byValue=NSValue(scnVector3:SCNVector3(x:Float(0.0),y:Float(Double.pi*2.0),z:Float(0.0)))
        rotate.repeatCount=Float.infinity
        rotate.duration=4.0
        textNode.addAnimation(rotate, forKey: "rotation")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

