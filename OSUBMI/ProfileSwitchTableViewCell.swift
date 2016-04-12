//
//  ReminderTableViewCell.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/9/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class ProfileSwitchTableViewCell: UITableViewCell {

    // MARK :- Outlets
    
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var reminderSwitch : UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(title : String, tag : Int, value : Bool){
        self.title.text = title
        self.reminderSwitch.tag = tag
        if !value {
            reminderSwitch.setOn(false, animated: true)
        }
    }
}
