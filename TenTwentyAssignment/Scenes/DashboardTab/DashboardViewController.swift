//
//  DashboardViewController.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 12/07/2022.
//

import UIKit

class DashboardViewController: UIViewController {

    private let tableView = UITableViewFactory.createUITableView()
    
    
    private let viewModel: DashboardViewModelType
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
    }
    
    init(viewModel: DashboardViewModelType) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension DashboardViewController {
    
    func setupViews() {
        
    }
}

