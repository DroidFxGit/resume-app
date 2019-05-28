//
//  MainFooterView.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit

// MARK: - ActionButton enum
/// Enumerations for option buttons
enum ActionButton {
    case linkedin
    case github
}

// MARK: - MainFooterViewDelegate protocol
protocol MainFooterViewDelegate: class {
    func didSelectionOption(option: ActionButton)
}

// MARK: - MainFooterView class
class MainFooterView: UIView {
    
    // MARK: - Attributes
    @IBOutlet var contentView: UIView!
    
    weak var delegate: MainFooterViewDelegate?
    
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
        Bundle.main.loadNibNamed("MainFooterView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    // MARK: - Actions
    @IBAction func linkedinAction(_ sender: UIButton) {
        delegate?.didSelectionOption(option: .linkedin)
    }
    
    @IBAction func githubAction(_ sender: UIButton) {
        delegate?.didSelectionOption(option: .github)
    }
    
}
