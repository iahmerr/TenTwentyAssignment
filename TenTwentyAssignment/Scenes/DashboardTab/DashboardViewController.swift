//
//  DashboardViewController.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 12/07/2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class DashboardViewController: UIViewController {
    
    private enum Constants {
        static let headingLabelLeading: CGFloat = 30
        static let headingLabelTop: CGFloat = 30
        static let headingLabelHeight: CGFloat = 80
    }

    private let headingLabel: UILabel = UILabelFactory.createUILabel(with: .black, textStyle: .regular, fontWeight: .medium, alignment: .left, text: "Watch")
    private let tableView = UITableViewFactory.createUITableView()
    
    private let disposeBag = DisposeBag()
    private let viewModel: DashboardViewModelType
    private var dataSource: RxTableViewSectionedReloadDataSource<SectionModel<Int, ReusableTableViewCellViewModelType>>!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
        registerTableViewCells()
        bind()
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
        tableView.backgroundColor = .appBackgroundColor
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
    
    func registerTableViewCells(){
        tableView.register(DashboardTableViewCell.self, forCellReuseIdentifier: DashboardTableViewCell.reuseIdentifier)
    }
}

fileprivate extension DashboardViewController {
    
    func bind(){
        
        dataSource = RxTableViewSectionedReloadDataSource(configureCell: { (_, tableView, _, viewModel) in
            let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reusableIdentifier) as! ReusableTableViewCell
            cell.configure(with: viewModel)
            return cell
        })
        
//        viewModel.outputs.dataSource.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
    }
}

