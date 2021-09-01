//
//  DrawerCell.swift
//  AutomateProto
//
//  Created by Muneeb Ahmad on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit
import Reusable

class DrawerCell: UITableViewCell, Reusable {

    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ivThumb.layer.masksToBounds = false;
        ivThumb.layer.cornerRadius = 5;
        ivThumb.clipsToBounds = true;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}/** end class. */
