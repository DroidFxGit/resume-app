//
//  ProjectsViewController.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit

// MARK: - ProjectsViewController class
class ProjectsViewController: UIViewController {

    // MARK: - Attributes
    @IBOutlet weak var tableView: UITableView!
    private let projects: [Project]
    private var datasource: TableViewDatasource<Project>!
    
    // MARK: - initializers
    init(projects: [Project]) {
        self.projects = projects
        super.init(nibName: "ProjectsViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController Main Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Recent projects"
        
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "projectsCell")
        datasource = TableViewDatasource<Project>(tableView: tableView, datasource: projects, reuseIdentifier: "projectsCell")
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension ProjectsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
