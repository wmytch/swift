//
//  GameScene.swift
//  SpiritKit
//
//  Created by Mac on 2018/3/29.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        self.scaleMode = .aspectFill
        
        let label=SKLabelNode(text:"J20")
        label.position=CGPoint(x:size.width/2.0,y:0)
        self.addChild(label)
        
        let spriteNode=SKSpriteNode(imageNamed:"j20.jpg")
        spriteNode.position=CGPoint(x:size.width/2.0,y:size.height/2.0)
        self.addChild(spriteNode)
    }

}
