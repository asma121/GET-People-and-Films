//
//  FilmsTableViewCell.swift
//  GET People and Films
//
//  Created by admin on 25/12/2021.
//

import UIKit

class FilmsTableViewCell: UITableViewCell {

    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
