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


class Ds3rdPostDetailViewController: UITableViewController {
    var postID: String?
    var postURL=URL(string:"http://www.dszh81.com/get_thread_content_ajax/1/4415/0/?r=0.8774493987605836")
    
    
    @IBAction func closeDetail(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getPostDetail(){
        Alamofire.request(postURL!).responseString { response in
//            print("Success: \(response.result.isSuccess)")
//            print("Response Text: \(response.result.value ?? "鼎盛三院")")
            if let postData = response.result.value?.data(using: .utf8, allowLossyConversion: false) {
                if let post = try? JSON(data: postData){
//                    for (_,subJson):(String, JSON) in post["Target_Thread"] {
//                        // Do something you want
//                        print("detail:\(post)")
//                    }
                    print("detail:\(post)")

                }
            }
//            self.forumData.parsePages(from: response.result.value ?? "")
//            self.tableView.reloadData()
//            self.removeLoadingScreen()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("postID:\(postID ?? "none")")
        getPostDetail()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
