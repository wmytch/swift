//
//  ViewController.swift
//  OperationQueues
//
//  Created by Mac on 2018/3/20.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    let hosts=["www.163.com","www.weibo.com","www.tencent.com","www.apple.com","www.sina.com.cn"]
    let queue=OperationQueue()
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        tableView.delegate = self
//        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableview :UITableView!)->Int{
        return 1
    }

    func tableView(_ tableView:UITableView,numberOfRowsInSection section:Int)->Int{
        return hosts.count
    }

    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath)-> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "FaviconCell") as! FaviconTableViewCell
        let host=hosts[indexPath.row]
        let url=URL(string:"http://\(host)/favicon.ico")
      
        cell.operationQueue=queue
        cell.url=url
        return cell
    }
}

