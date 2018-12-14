//
//  PostDetailCell.swift
//  ds3rd
//
//  Created by Mac on 2018/8/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

class PostDetailCell: UITableViewCell {

    @IBOutlet weak var Timestamp: UILabel!
    @IBOutlet weak var Subscriber: UILabel!
    @IBOutlet weak var Content: UILabel!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Address: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
