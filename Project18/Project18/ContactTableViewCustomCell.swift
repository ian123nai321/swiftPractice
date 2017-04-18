//
//  ContactVC_TableViewCell.swift
//  Project18
//
//  Created by 吳政緯 on 2017/4/10.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import UIKit

class ContactTableViewCustomCell: UITableViewCell {
    
    var contactData:ContactInformation?{
        didSet{
        profileImageView.image = contactData?.photo
        nameLabel.text = contactData?.name
        }
    }
    
    @IBOutlet weak var profileImageView: UIImageView!{
        didSet{
            profileImageView.contentMode = .scaleAspectFill
            profileImageView.layer.masksToBounds = false
            profileImageView.layer.cornerRadius = profileImageView.frame.height/2
            profileImageView.clipsToBounds = true
        }
    }

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
