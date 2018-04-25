//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Mac on 2018/4/1.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="videoSague" {
            let videoURL=Bundle.main.url(forResource: "俄语发音口型视频",withExtension:"mp4")
            let audioURL=Bundle.main.url(forResource:"02 Into Town",withExtension:"m4r")
            let videoViewController=segue.destination as! AVPlayerViewController
            videoViewController.player=AVPlayer(url: videoURL!)
            videoViewController.player=AVPlayer(url:audioURL!)
        }
    }
}

