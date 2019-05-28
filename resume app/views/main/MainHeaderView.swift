//
//  MainHeaderView.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit

// MARK: - MainHeaderModel struct
struct MainHeaderModel {
    var name: String!
    var title: String!
    var profileURL: URL!
    
    init() {}
}

// MARK: - MainHeaderView class
class MainHeaderView: UIView {
    
    // MARK: -Attributes
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            self.profileImageView.applyStyle(for: .profile)
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("MainHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    // MARK: - Public functions
    /**
     Configures view with given model
     
     - Parameter model: model data type for view
     */
    func configure(model: MainHeaderModel) {
        profileImageView.imageFromUrl(url: model.profileURL, placeholderImage: "preview")
        nameLabel.text = model.name
        titleLabel.text = model.title
    }
}

