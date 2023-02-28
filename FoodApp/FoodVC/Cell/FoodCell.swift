//
//  FoodCell.swift
//  FoodApp
//
//  Created by Macbook on 28/02/23.
//

import UIKit

class FoodCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
