//
//  SettingsViewCell.swift
//  AutomateProto
//
//  Created by Talha Ghous on 23/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit
import Reusable

class SettingsViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}/** end class. */
