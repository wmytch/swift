//
//  Ds3rdPostDetailViewController.swift
//  ds3rd
//
//  Created by Mac on 2018/7/11.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class Ds3rdPostDetailViewController: DsForumViewController {
    var postID: String?
//    lazy var postURL=URL(string:"http://www.dszh81.com/get_thread_content_ajax/1/"+self.postID!+"4415/0/?r=0.8774493987605836")
    lazy var postDetail = Ds3rdPostDetail(from: postID!)
    @IBAction func closeDetail(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLoadingScreen()
        self.postDetail.parsePages(from: "aa")
       // getPostDetail()
    }
    
    func getPostDetail(){
//        postDetail=Ds3rdPostDetail(from : postID!)
        print("url:\(String(describing: postDetail.postURL!))")
        Alamofire.request((postDetail.postURL!)).responseString { response in
            print("Success: \(response.result.isSuccess)")
//            print("Response Text: \(response.result.value ?? "鼎盛三院")")
            
            self.postDetail.parsePages(from: response.result.value ?? "")
            self.tableView.reloadData()
            self.removeLoadingScreen()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postDetail.detailArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "ds3rdPostDetailCell",for : indexPath) as! PostDetailCell
        cell.Title?.text=self.postDetail.detailArray[indexPath.row].detailTitle
        cell.Content?.text=self.postDetail.detailArray[indexPath.row].detailContent
        cell.Subscriber?.text=self.postDetail.detailArray[indexPath.row].detailSubscriber
        cell.Address?.text=self.postDetail.detailArray[indexPath.row].detailAddress
        cell.Timestamp?.text=self.postDetail.detailArray[indexPath.row].detailTimestamp
        

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
