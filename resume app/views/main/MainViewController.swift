//
//  MainViewController.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit

// MARK: - MainTableSection enum
/// Enumeration for tableView sections
enum MainTableSection: Int {
    case description = 0
    case projects
    case experience
}

// MARK: - MainViewController class
class MainViewController: UIViewController {
    
    // MARK: - Attributes
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = MainViewModel()
    private let sections: [MainTableSection] = [.description, .projects, .experience]
    fileprivate let kCellIdentifier = "mainCellIdentifier"
    
    // MARK: - UIViewController Main Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        viewModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
        
        let footer = MainFooterView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
        footer.delegate = self
        tableView.tableFooterView = footer
        
        UIAlertControllerView.showLoading(from: self, message: "Loading info...")
        fetchData()
    }
    
    // MARK: - Private functions
    private func fetchData() {
        viewModel.updatedData = {
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.configureHeader()
                strongSelf.tableView.reloadData()
                UIAlertControllerView.hideLoading(from: strongSelf)
            }
        }
        viewModel.fetchMainInfo()
    }
    
    private func configureHeader() {
        var headerModel = MainHeaderModel()
        headerModel.profileURL = viewModel.resumeResponse?.profileURL
        headerModel.name = viewModel.resumeResponse?.name
        headerModel.title = viewModel.resumeResponse?.title
        let header = MainHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 260.0))
        header.configure(model: headerModel)
        
        tableView.tableHeaderView = header
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier) else {
            preconditionFailure("cannot dequeue cell with \(kCellIdentifier)")
        }
        
        switch section {
        case .description:
            cell.selectionStyle = .none
            cell.textLabel?.textAlignment = .justified
            cell.textLabel?.text = viewModel.resumeResponse?.description
            cell.textLabel?.numberOfLines = 0
        case .projects:
            cell.textLabel?.text = "Projects"
            cell.accessoryType = .disclosureIndicator
        case .experience:
            cell.textLabel?.text = "Experience"
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let section = sections[indexPath.section]
        switch section {
        case .description:
            preconditionFailure("not handled method")
        case .projects:
            guard let projets = viewModel.resumeResponse?.projects else { return }
            let projectsView = ProjectsViewController(projects: projets)
            navigationController?.pushViewController(projectsView, animated: true)
        case .experience:
            guard let companies = viewModel.resumeResponse?.experience else { return }
            let projectsView = ExperienceViewController(companies: companies)
            navigationController?.pushViewController(projectsView, animated: true)
        }
    }
}

// MARK: - MainViewModelDelegate
extension MainViewController: MainViewModelDelegate {
    func didShowError(error: Error) {
        DispatchQueue.main.async {
            UIAlertControllerView.hideLoading(from: self, completion: {
                UIAlertControllerView.showAlert(from: self, title: "Error", message: error.localizedDescription)
            })
        }
    }
}

// MARK: - MainFooterViewDelegate
extension MainViewController: MainFooterViewDelegate {
    func didSelectionOption(option: ActionButton) {
        switch option {
        case .linkedin:
            guard let url = URL(string: ConfigurationUtils.value(.linkedinURL)) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        case .github:
            guard let url = URL(string: ConfigurationUtils.value(.githubURL)) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
