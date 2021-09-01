//
//  GenericCollectionViewCell.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit
import Reusable

class GenericCollectionViewCell: UICollectionViewCell, Reusable {

    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.cornerRadius = 8;
        contentView.layer.borderWidth = 1.0;
        contentView.layer.borderColor = UIColor.clear.cgColor;
        contentView.layer.masksToBounds = true;
        
        layer.shadowColor = UIColor.lightGray.cgColor;
        layer.shadowOffset = CGSize(width:0,height: 2.0);
        layer.shadowRadius = 8.0;
        layer.shadowOpacity = 1.0;
        layer.masksToBounds = false;
        layer.shadowPath = UIBezierPath(roundedRect:bounds,cornerRadius:contentView.layer.cornerRadius).cgPath;
    }

}/** end class. */
