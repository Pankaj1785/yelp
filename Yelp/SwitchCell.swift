//
//  SwitchCell.swift
//  Yelp
//
//  Created by Pankaj Manghnani on 9/21/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol SwitchCellDelegate {
    optional func switchCell(switchCell:SwitchCell, didChangeValue value:Bool)
}
class SwitchCell: UITableViewCell {


    @IBOutlet weak var onSwitch: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    weak var delegate: SwitchCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        onSwitch.addTarget(self,action:"switchValueChanged",forControlEvents:UIControlEvents.ValueChanged)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchValueChanged(){
        delegate?.switchCell?(self, didChangeValue: onSwitch.on)
        
    
    }

}
