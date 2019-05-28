//
//  ExperienceViewController.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit

class ExperienceViewController: UIViewController {

    // MARK: - Attributes
    @IBOutlet weak var tableView: UITableView!
    private let companies: [Company]
    private var datasource: TableViewDatasource<Company>!
    
    // MARK: - Initializers
    init(companies: [Company]) {
        self.companies = companies
        super.init(nibName: "ExperienceViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController Main Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Experience"
        
        tableView.delegate = self
        tableView.register(UINib(nibName: "CompanyCell", bundle: nil), forCellReuseIdentifier: "companyCell")
        datasource = TableViewDatasource<Company>(tableView: tableView, datasource: companies, reuseIdentifier: "companyCell")
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension ExperienceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
