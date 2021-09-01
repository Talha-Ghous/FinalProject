//
//  Button.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class Button: UIButton {

    var highlightColor: UIColor?;
    var customBgColor: UIColor?;
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? highlightColor : customBgColor;
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}/** end class. */
