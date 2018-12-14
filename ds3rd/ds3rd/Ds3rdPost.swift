//
//  ds3rdPost.swift
//  ds3rd
//
//  Created by Mac on 2018/5/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

import Foundation
import SwiftyJSON

class Ds3rdPost {
    let ds3rdUrl=URL(string:"http://www.dszh81.com/list_forum_compact_threads_ajax/1/?pn=1&ps=50&OCN=reply&tid=0&r=0.53021220988082787632")
    
    struct PostSubject{
        var postTitle=""
        var postAuxTitle=""
        var postID=""
    }
    var postArray=[PostSubject]()
    
    func parsePages(from responseData : String){
        if responseData==""{
            return
        }
        var currentSubject=PostSubject()
        if let postData = responseData.data(using: .utf8, allowLossyConversion: false) {
            if let post = try? JSON(data: postData){
                for (_,subJson):(String, JSON) in post["Thread_List"] {
                    // Do something you want
                    currentSubject.postTitle="\(subJson[6])"
                    currentSubject.postAuxTitle="\(subJson [17])  \(subJson[20]) [\(subJson[16])]"
                    currentSubject.postID="\(subJson[2])"
                    postArray.append(currentSubject)
                }
            }
        }
    }
    
    var postFieldIndex = [
        "id_forum":0,
        "obj_forum":1,  //self.obj_forum,
        "id_thread_message": 2,  // 主贴ID 如果自己是主贴就是重合的
        "id_message": 3,  // 本条消息ID 如果刚好就是主贴 则和 主贴ID 一样
        "id_father_message": 4,  // 父节点的ID 可能是 主贴也可能是 回帖 因为统一结构了
        "is_main_thread": 5,
        "title_message": 6,
        "length_message": 7,  // 内容的字节数
        "id_emojo_message": 8,
        "emojo_path_message": 9,
        "ip_submit_mesage": 10,
        "status_message": 11,  // 状态 主贴和回帖一样的定义规范
        "submit_time": 12,
        "modify_time": 13,
        "memo_message": 14,
        "reward_message": 15,  // 主贴才有的奖章项目
        "count_reply": 16,  // 回复的数量 只有主贴有此项
        "name_poster_message": 17,  // 提交人
        "id_poster_message": 18,  // 提交人
        //"poster_message_signature": self.poster_message_signature,  // 提交人签名
        "browse_count_message": 19,  // 被单独浏览的次数
        "lastreply_time": 20,  // 最后回复时间
        "is_star":21,
        "is_top": 22,
        "has_a_tag":23, // 标志是否有A标签
        "has_img_tag":24,  // 标记是否有img标签
        "related_tags": 25,  // 相关标签
        "child_msgs": 26 // 回帖列表
    ]
    
    
}

class Ds3rdPostDetail{
    var postURL:URL?
    struct PostDetail{
        var detailTitle:String?
        var detailContent:String?
        var detailSubscriber:String?
        var detailAddress:String?
        var detailTimestamp:String?
    }
    var detailArray=[PostDetail]()
    
    init(from postID:String){
        postURL=URL(string:"http://www.dszh81.com/get_thread_content_ajax/1/"+postID+"/0/?r=0.8774493987605836")
    }
    
    func parsePages(from responseData : String){
        if responseData==""{
            return
        }
        var currentDetail=PostDetail()
//        if let postData = responseData.data(using: .utf8, allowLossyConversion: false) {
            print("parsePages:\(String(describing: postURL!))")
//            if let post = try? JSON(data: postData){
//                for (_,subJson):(String, JSON) in post["Thread_List"] {
                    // Do something you want
                    currentDetail.detailTitle="\(String(describing: postURL!))"
                    currentDetail.detailContent="帖子内容"
                    currentDetail.detailSubscriber="mytch"
                    currentDetail.detailTimestamp="2018-08-09 20:53:11"
                    currentDetail.detailAddress="广州"
                    detailArray.append(currentDetail)
        currentDetail.detailTitle="\(String(describing: postURL!))"
        currentDetail.detailContent="帖子内容：\(String(describing: postURL!))"
        currentDetail.detailSubscriber="Mytch"
        currentDetail.detailTimestamp="2018-08-09 20:53:11"
        currentDetail.detailAddress="北京"
        detailArray.append(currentDetail)
//                }
//            }
 //       }
    }
    
}
//[
//[1, "", 2571, 2571, "", true, "添加表情问题,你们希望加哪些表情 把图片放在跟帖里面吧。看情况添加", 0, 39, "/emojo/1/39.gif", "61.163.107.194", 1, "2018-05-10 17:17:59", "2018-05-10 17:17:59", "", 0, 11, "pickup", 29, 218, "2018-05-19 19:30:36", 0, 1, 0, 0, [],
// [
//    [1, "", 2571, 16299, 0, false, ".", 0, 0, "", "182.46.9.110", 1, "2018-05-19 19:30:36", "2018-05-19 19:30:36", "", -1, 0, "北斗星", 751, 3, "2018-05-19 19:30:36", 0, 0, 0, 0, [], []],
//    [1, "", 2571, 16055, 0, false, "大拇指的表情", 0, 0, "", "115.199.101.225", 1, "2018-05-18 08:20:21", "2018-05-18 08:20:21", "", -1, 0, "军美", 32, 3, "2018-05-18 08:20:21", 0, 0, 0, 0, [], []],
//    [1, "", 2571, 15506, 0, false, "小飞猪或隔壁的猪拍掌", 255, 40, "/emojo/1/40.gif", "219.74.172.139", 1, "2018-05-14 21:09:49", "2018-05-19 14:59:00", "", -1, 0, "utway", 501, 13, "2018-05-19 14:59:00", 0, 0, 0, 1, [], []],
//    [1, "", 2571, 15365, 0, false, "要求增加笑哭，捂脸这两个。。", 0, 0, "", "175.0.222.136", 1, "2018-05-14 09:23:49", "2018-05-14 09:23:49", "", -1, 0, "冷静燃烧", 178, 4, "2018-05-14 09:23:49", 0, 0, 0, 0, [], []],
//    [1, "", 2571, 15146, 0, false, "亲亲的", 0, 0, "", "183.245.221.253", 1, "2018-05-12 12:57:05", "2018-05-12 12:57:05", "", -1, 0, "这样不好吧", 1550, 1, "2018-05-12 12:57:05", 0, 0, 0, 0, [], []],
//    [1, "", 2571, 15127, 0, false, "把小图标直接贴过来，你叫个名字等我画出来么？", 0, 0, "", "1.192.32.81", 1, "2018-05-12 02:07:58", "2018-05-12 02:07:58", "", -1, 0, "pickup", 29, 1, "2018-05-12 02:07:58", 0, 0, 0, 0, [], []],
//    [1, "", 2571, 15062, 0, false, "头条里那个拖鞋打脸的", 0, 0, "", "219.133.174.234", 1, "2018-05-11 14:12:23", "2018-05-11 14:12:23", "", -1, 0, "撸而不色", 253, 2, "2018-05-11 14:12:23", 0, 0, 0, 0, [], []],
//    [1, "", 2571, 15047, 0, false, "“赞”字。", 0, 0, "", "36.149.161.144", 1, "2018-05-11 12:39:18", "2018-05-11 12:39:18", "", -1, 0, "五庄观主", 541, 1, "2018-05-11 12:39:18", 0, 0, 0, 0, [], []],
//    [1, "", 2571, 15014, 0, false, "挖鼻屎的图标", 0, 0, "", "180.97.206.38", 1, "2018-05-11 10:55:35", "2018-05-11 10:55:35", "", -1, 0, "波多野结衣", 1208, 0, "2018-05-11 10:55:35", 0, 0, 0, 0, [], []],
//    [1, "", 2571, 14955, 0, false, "看图说话：", 159, 0, "", "223.72.66.11", 1, "2018-05-11 08:32:55", "2018-05-11 08:32:55", "", -1, 0, "赤色要塞", 66, 31, "2018-05-11 08:32:55", 0, 0, 0, 1, [], []],
//    [1, "", 2571, 14897, 0, false, "拍掌的。", 0, 0, "", "124.91.174.181", 1, "2018-05-10 19:58:10", "2018-05-10 19:58:10", "", -1, 0, "012356789", 344, 4, "2018-05-10 19:58:10", 0, 0, 0, 0, [], []]
//    ]
//]
