//
//  Eligibility_Material_Button.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/7/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class Eligibility_Material_Button: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10.0
        self.titleLabel?.font = UIFont(name: (self.titleLabel?.font?.fontName)!, size: 30)
    }

}
