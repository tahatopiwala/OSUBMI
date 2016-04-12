//
//  PermissionsTableViewCell.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/9/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class PermissionsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var switchValue: UISwitch!
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var descriptionText : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(title : String, detail : String, value : Bool, tag : Int) {
        self.title.text = title
        self.descriptionText.text = detail
        self.switchValue.setOn(value, animated: true)
        self.switchValue.tag = tag
    }

}
