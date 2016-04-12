//
//  Material_Blur_View.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/8/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import UIKit

class Material_Blur_View: UIView {
    
    override func awakeFromNib() {
        let effect = UIBlurEffect(style: .Light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = self.bounds
        self.addSubview(effectView)
        self.layer.cornerRadius = 20.0
        self.clipsToBounds = true
        
    }

}
