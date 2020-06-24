//
//  HorrorMovieCell.swift
//  Homework48
//
//  Created by Kato on 6/24/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class HorrorMovieCell: UITableViewCell {

    @IBOutlet weak var horrorMovieImageView: UIImageView!
    @IBOutlet weak var horrorMovieTitleLabel: UILabel!
    @IBOutlet weak var horrorMovieStorylineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
