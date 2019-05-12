//
//  ShowLabelsTableViewCell.swift
//  got-earth
//
//  Created by Ian Bastos on 10/05/2019.
//  Copyright © 2019 Ian Bastos. All rights reserved.
//

import UIKit

class ShowLabelsTableViewCell: UITableViewCell {

    @IBOutlet weak var checkbox: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var labelText: String!
    var isDisabled: Bool! = false
    var isChecked: Bool! = true
    var tapGesture: UITapGestureRecognizer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // checkbox event listener
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCheckboxClick))
        checkbox.addGestureRecognizer(tapGesture)
        checkbox.isUserInteractionEnabled = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func drawCheckbox() {
        if (isDisabled) {
            checkbox.image = UIImage(named: "disabled.png")
            return
        }
        
        if (isChecked) {
            checkbox.image = UIImage(named: "checked.png")
        } else {
            checkbox.image = UIImage(named: "unchecked.png")
        }
    }
    
    @objc
    func handleCheckboxClick() {
        isChecked = !isChecked
        drawCheckbox()
        
        // TODO notify some data observer
    }
    
}
