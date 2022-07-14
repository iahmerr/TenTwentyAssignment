//
//  MovieDetailViewController.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import UIKit
import RxSwift

final class MovieDetailViewController: UIViewController {


    private lazy var tableView: UITableView = UITableViewFactory.createUITableView(seperatorStyle: .none)
    
    private let disposeBag = DisposeBag()
    private let viewModel: MovieDetailViewModelType
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.isNavigationBarHidden = true
        
        setupTableViewCell()
        setupViews()
        setupConstraints()
        bind()
    }
    
    init(viewModel: MovieDetailViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

fileprivate extension MovieDetailViewController {
    
    func setupViews(){
        [tableView].forEach(view.addSubview)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -50)
        ])
    }
    
    func setupTableViewCell() {
        tableView.register(HeaderImageTableViewCell.self, forCellReuseIdentifier: HeaderImageTableViewCell.reuseIdentifier)
        tableView.register(MovieOverviewTableViewCell.self, forCellReuseIdentifier: MovieOverviewTableViewCell.reuseIdentifier)
    }
}

fileprivate extension MovieDetailViewController {
    
    func bind() {
        viewModel.outputs.reloadTableView.subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }).disposed(by: disposeBag)
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputs.numberOfRows(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.outputs.getCellViewModel(for: indexPath.row).reusableIdentifier, for: indexPath) as! ReusableTableViewCell
        cell.configure(with: viewModel.outputs.getCellViewModel(for: indexPath.row))
        return cell
    }
}
