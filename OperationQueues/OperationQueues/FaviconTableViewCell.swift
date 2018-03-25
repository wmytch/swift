//
//  FaviconTableViewCell.swift
//  OperationQueues
//
//  Created by Mac on 2018/3/20.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit


class FaviconTableViewCell: UITableViewCell {
    var operationQueue:OperationQueue?
    
    var url: URL? {
        didSet{
            let request=URLRequest(url: self.url! )
            self.textLabel?.text=self.url?.host
            URLSession(configuration: .default).dataTask(with:request,completionHandler: {
                    (data:Data?,response:URLResponse?,error:Error?) in
                let image=UIImage(data:data!)
                    OperationQueue.main.addOperation(){
                        self.imageView?.image=image
                        self.setNeedsLayout()
                    }
                }
            ).resume()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
