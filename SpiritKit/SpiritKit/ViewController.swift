//
//  ViewController.swift
//  SpiritKit
//
//  Created by Mac on 2018/3/29.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let scene=GameScene(size:self.view.bounds.size)
        scene.backgroundColor=UIColor.black
        scene.scaleMode = .aspectFill
        
        let skView=self.view as! SKView
        skView.presentScene(scene)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

