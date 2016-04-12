//
//  Material_Image_Rounded.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/8/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class Material_Image_Rounded: UIView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 60
        self.clipsToBounds = true
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.blackColor().CGColor
    }

}
