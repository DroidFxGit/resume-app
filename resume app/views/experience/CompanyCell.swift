//
//  CompanyCell.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit

// MARK: - CompanyCell class
class CompanyCell: UITableViewCell {

    // MARK: - Attributes
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Main Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /**
     Configures cells with given model
     
     - Parameter model: model data type for cell
     */
    func configure(model: Company) {
        imageViewLogo.imageFromUrl(url: model.logoURL, placeholderImage: "preview")
        companyLabel.text = model.company
        positionLabel.text = model.position
        periodLabel.text = model.period
        descriptionLabel.text = model.description
    }
}
