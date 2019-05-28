//
//  TableViewDatasource.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit

// MARK: - TableViewDatasource class
class TableViewDatasource<T>: NSObject, UITableViewDataSource {
    
    // MARK: - Attributes
    var datasource: [T]
    var tableView: UITableView
    private let reuseIdentifier: String
    
    // MARK: - initializers
    init(tableView: UITableView, datasource: [T], reuseIdentifier: String) {
        self.datasource = datasource
        self.reuseIdentifier = reuseIdentifier
        self.tableView = tableView
        super.init()
        setup()
    }
    
    // MARK: - Main Functions
    func setup() {
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let projects = datasource as? [Project] {
            let project = projects[indexPath.row]
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: reuseIdentifier)
            cell.textLabel?.text = project.name
            cell.detailTextLabel?.text = project.description
            cell.detailTextLabel?.numberOfLines = 0
            
            return cell
        }
        
        if let companies = datasource as? [Company] {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? CompanyCell else {
                preconditionFailure("cannot dequeue cell for \(CompanyCell.self)")
            }
            let company = companies[indexPath.row]
            cell.configure(model: company)
            return cell
        }
        
        fatalError("datasource not supported")
    }
}
