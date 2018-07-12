//
//  ViewController.swift
//  ds3rd
//
//  Created by Mac on 2018/4/30.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit
//import Kanna


class DsForumViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier=segue.identifier{
            switch identifier {
            case "ds3rdSegue":
                if let vc=segue.destination as? PostViewController{
                    vc.navigationItem.title = "鼎盛三院"
                }
            case "dszhSegue":
                if let vc=segue.destination as? PostViewController{
                    vc.navigationItem.title = "鼎盛中华"
                }
            default:break
            }
        }
    }

}

