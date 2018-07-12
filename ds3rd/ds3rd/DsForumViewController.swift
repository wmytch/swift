//
//  ViewController.swift
//  ds3rd
//
//  Created by Mac on 2018/4/30.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit
//import Alamofire
//import Kanna

class DsForumViewController: UITableViewController {
    let loadingView = UIView()
    let spinner = UIActivityIndicatorView()
    let loadingLabel = UILabel()
    
    func setLoadingScreen() {
        let width: CGFloat = 120
        let height: CGFloat = 40
        let x:CGFloat = (self.tableView.frame.width / 2) - (width / 2)
        let y:CGFloat = (self.tableView.frame.height / 2) - (height / 2) - (self.navigationController?.navigationBar.frame.height)!
        loadingView.frame = CGRect(x:x, y:y, width:width, height:height)
        
        self.loadingLabel.textColor = UIColor.red
        self.loadingLabel.textAlignment = NSTextAlignment.center
        self.loadingLabel.text = "Loading..."
        self.loadingLabel.frame = CGRect(x:0, y:0, width:140, height:40)
        
        self.spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.spinner.color=UIColor.red
        self.spinner.frame = CGRect(x:0, y:0, width:40, height:40)
        self.startLoadingScreen()
        
        loadingView.addSubview(self.spinner)
        loadingView.addSubview(self.loadingLabel)
        self.tableView.addSubview(loadingView)
    }
    
    func startLoadingScreen(){
        self.spinner.startAnimating()
        self.loadingLabel.isHidden = false
    }
    
    func removeLoadingScreen() {
        self.spinner.stopAnimating()
        self.loadingLabel.isHidden = true
    }
}

