//
//  MovieDetailViewController.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import UIKit
import RxSwift

final class MovieDetailViewController: UIViewController {

    private enum Constants {
        static let tableViewTop: CGFloat = -50
        static let buttonTop: CGFloat = 50
        static let buttonLeading: CGFloat = 30
        static let buttonHeight: CGFloat = 30
        static let buttonWidthAspectRatio: CGFloat = 1
        static let tableViewEdgeInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
    }

    private lazy var tableView: UITableView = UITableViewFactory.createUITableView(seperatorStyle: .none)
    private lazy var backButton: UIButton = UIButtonFactory.createButton()
    
    private let disposeBag = DisposeBag()
    private let viewModel: MovieDetailViewModelType
    private let router: MovieDetailRouting
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = Constants.tableViewEdgeInset
        self.navigationController?.isNavigationBarHidden = true
        
        setupTableViewCell()
        setupViews()
        setupConstraints()
        bind()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 36, weight: .bold, scale: .large)
        let largeBoldIcon = UIImage(systemName: "arrow.left.circle.fill", withConfiguration: largeConfig)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        backButton.setImage(largeBoldIcon, for: .normal)
    }
    
    init(viewModel: MovieDetailViewModelType, router: MovieDetailRouting) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

fileprivate extension MovieDetailViewController {
    
    func setupViews(){
        [tableView, backButton].forEach(view.addSubview)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.buttonLeading),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.buttonTop),
            backButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor),
            
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.tableViewTop)
        ])
    }
    
    func setupTableViewCell() {
        tableView.register(HeaderImageTableViewCell.self, forCellReuseIdentifier: HeaderImageTableViewCell.reuseIdentifier)
        tableView.register(MovieGenreTableViewCell.self, forCellReuseIdentifier: MovieGenreTableViewCell.reuseIdentifier)
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
        
        backButton
            .rx
            .tap
            .subscribe(onNext: {[weak self] _ in
            guard let self = self else { return }
            self.router.pop(nav: self.navigationController!)
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
