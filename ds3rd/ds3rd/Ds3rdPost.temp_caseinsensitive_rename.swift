//
//  ds3rdPost.swift
//  ds3rd
//
//  Created by Mac on 2018/5/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

import Foundation

class Ds3rdPost {
    let ds3rdUrl=URL(string:"http://www.dszh81.com/list_forum_compact_threads_ajax/1/?pn=1&ps=20&OCN=reply&tid=0&r=0.5302122998083184")
    
    var postArray=[postSubject]()
    
    func parsePages(from jsonData : Any){
//        var currentdDetail=postDetail()
        var currentSubject=postSubject()
        
        currentSubject.postTitle="\u{9648}\u{7ecf}\u{ff1a}\u{4e2d}\u{56fd}\u{4eba}\u{4e0d}\u{597d}\u{7cca}\u{5f04}"
        currentSubject.postAuxTitle="mytch 2018-05-17"
        postArray.append(currentSubject)
//        let html = "<html><head><title>tid-kijyun/Kanna: Kanna(鉋) is an XML/HTML parser for Swift.</title></head><body><a class=\"js-selected-navigation-item HeaderNavlink px-2\" data-hotkey=\"g p\" data-ga-click=\"Header, click, Nav menu - item:pulls context:user\" aria-label=\"Pull requests you created\" data-selected-links=\"/pulls /pulls/assigned /pulls/mentioned /pulls\" href=\"/pulls\"> Pull requests       </a> </body></html>"
//
//        if let doc = try? HTML(html: html, encoding: .utf8) {
//            print(doc.title!)
//            currentPost.subjectID=doc.title!
//
//            // Search for nodes by CSS
//            for link in doc.css("a, link") {
//                print(link.text!)
//                print(link["href"]!)
//                currentPost.subjectTitle=link.text!+link["href"]!
//
//            }
//
//            // Search for nodes by XPath
//            for link in doc.xpath("//a | //link") {
//                print(link.text!)
//                print(link["href"]!)
//                currentPost.subjectDetail=link.text!+link["href"]!
//            }
//            postSubject.append(currentPost)
//        }
    }
    struct postInfo{
        var id_forum=""
        var obj_forum=""  //self.obj_forum,
        var id_thread_message=""  // 主贴ID 如果自己是主贴就是重合的
        var id_message=""  // 本条消息ID 如果刚好就是主贴 则和 主贴ID 一样
        var id_father_message=""  // 父节点的ID 可能是 主贴也可能是 回帖 因为统一结构了
        var is_main_thread=""
        var title_message=""
        var length_message=""  // 内容的字节数
        var id_emojo_message=""
        var emojo_path_message=""
        var ip_submit_mesage=""
        var status_message=""  // 状态 主贴和回帖一样的定义规范
        var submit_time=""
        var modify_time=""
        var memo_message=""
        var reward_message=""  // 主贴才有的奖章项目
        var count_reply=""  // 回复的数量 只有主贴有此项
        var name_poster_message=""  // 提交人
        var id_poster_message=""  // 提交人
        var browse_count_message=""  // 被单独浏览的次数
        var lastreply_time=""  // 最后回复时间
        var is_star=""
        var is_top=""
        var has_a_tag="" // 标志是否有A标签
        var has_img_tag=""  // 标记是否有img标签
        var related_tags=""  // 相关标签
        //var child_msgs : postDetail  // 回帖列表
    }
    struct main {
        var detail:postDetail
        var firstChild:postDetail
        
    }
    struct postSubject{
        var postTitle=""
        var postAuxTitle=""
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
