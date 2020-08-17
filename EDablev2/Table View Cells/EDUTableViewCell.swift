//
//  EDUTableViewCell.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/11/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit

class EDUTableViewCell: UITableViewCell {

    @IBOutlet weak var tableDescription: UILabel!
    @IBOutlet weak var tableTitle: UILabel!
    @IBOutlet weak var tableImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
