//
//  DashboardViewController.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 12/07/2022.
//

import UIKit

class DashboardViewController: UIViewController {
    
    private enum Constants {
        static let headingLabelLeading: CGFloat = 20
        static let headingLabelTop: CGFloat = 20
        static let headingLabelHeight: CGFloat = 120
    }

    private let headingLabel: UILabel = UILabelFactory.createUILabel(with: .black, textStyle: .regular, fontWeight: .medium, alignment: .left, text: "Watch")
    private let tableView = UITableViewFactory.createUITableView()
    
    
    private let viewModel: DashboardViewModelType
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    init(viewModel: DashboardViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension DashboardViewController {
    
    func setupViews() {
        [headingLabel, tableView].forEach(view.addSubview)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            headingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.headingLabelLeading),
            headingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.headingLabelTop),
            headingLabel.heightAnchor.constraint(equalToConstant: Constants.headingLabelHeight),
            
            tableView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

