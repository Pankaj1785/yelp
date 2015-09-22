//
//  BusinessCell.swift
//  Yelp
//
//  Created by Pankaj Manghnani on 9/21/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ratingCount: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var address: UILabel!
    
    var business: Business! {
        
        didSet{
            name.text=business.name
            thumbImageView.setImageWithURL(business.imageURL)
            category.text=business.categories
            address.text=business.address
            ratingCount.text="\(business.reviewCount!) Reviews"
            ratingImageView.setImageWithURL(business.ratingImageURL)
            distance.text=business.distance
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbImageView.layer.cornerRadius=3
        thumbImageView.clipsToBounds=true
        name.preferredMaxLayoutWidth=name.frame.size.width
        // Initialization code
    }
    override func layoutSubviews() {
    super.layoutSubviews()
        name.preferredMaxLayoutWidth=name.frame.size.width
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
