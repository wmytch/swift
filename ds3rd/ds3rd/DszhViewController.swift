//
//  DszhViewController.swift
//  ds3rd
//
//  Created by Mac on 2018/6/14.
//  Copyright © 2018年 Mac. All rights reserved.
//
import Foundation
import UIKit
import Alamofire

class DszhViewController: DsForumViewController {
    let forumData=Ds3rdPost()

    @IBAction func refresh(_ sender: UIBarButtonItem) {
        self.startLoadingScreen()
        getPostList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLoadingScreen()
        getPostList()
    }
    
    func getPostList(){
        Alamofire.request(self.forumData.ds3rdUrl!).responseString { response in
            //                       print("Success: \(response.result.isSuccess)")
            //                       print("Response Text: \(response.result.value ?? "鼎盛中华")")
            
            self.forumData.parsePages(from: response.result.value ?? "")
            self.tableView.reloadData()
            self.removeLoadingScreen()
            
        }
    }
    
    func numberOfSectionsInTableView(tableview :UITableView!)->Int{
        return 1
    }
    
    override func tableView(_ tableView:UITableView,numberOfRowsInSection section:Int)->Int{
        return forumData.postArray.count  //in case test
    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath)-> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "postSubjectID")
        
        cell?.detailTextLabel?.text=self.forumData.postArray[indexPath.row].postAuxTitle
        cell?.textLabel?.text=self.forumData.postArray[indexPath.row].postTitle
        return cell!
    }
}
