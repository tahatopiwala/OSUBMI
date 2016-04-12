//
//  Material_Image_Rounded_100.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/8/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class Material_Image_Rounded_80: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = 35
        self.clipsToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.grayColor().CGColor
    }

}
