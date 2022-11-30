//
//  LeaguePopupTableViewCell.swift
//  Scoreo
//
//  Created by Remya on 10/29/22.
//

import UIKit

class LeaguePopupTableViewCell: UITableViewCell {
    @IBOutlet weak var lblLeague:UILabel!
    @IBOutlet weak var imgLeague:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
