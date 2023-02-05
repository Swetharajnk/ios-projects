//
//  SchoolCell.swift
//  NYCSchools
//
//  Created by SwethaVipinKumar on 11/01/23.
//

import UIKit

class SchoolCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - override function
    override func awakeFromNib() {
        super.awakeFromNib()
        // Remove cell highlight/selection color
        self.selectionStyle = .none
    }
    
    func configure(_ school: SATScoreModel) {
        nameLabel.text = school.schoolName
    }
}
