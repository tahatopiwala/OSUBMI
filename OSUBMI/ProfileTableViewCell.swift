//
//  ProfileTableViewCell.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/8/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(title : String){
        self.cellTitle.text = title
    }

}
