//
//  DashboardViewController.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 12/07/2022.
//

import UIKit
import RxSwift
import RxCocoa

final class DashboardViewController: UIViewController {
    
    private enum Constants {
        static let headingLabelLeading: CGFloat = 30
        static let headingLabelTop: CGFloat = 30
        static let headingLabelHeight: CGFloat = 30
        static let searchIconTrailing: CGFloat = -30
        static let searchButtonHeight: CGFloat = 30
    }

    private let headingLabel: UILabel = UILabelFactory.createUILabel(with: .black, textStyle: .regular, fontWeight: .medium, alignment: .left, text: "Watch")
    private let searchButton: UIButton = UIButtonFactory.createButton()
    private lazy var tableView: UITableView = UITableViewFactory.createUITableView(seperatorStyle: .none)
    
    private let disposeBag = DisposeBag()
    private let viewModel: DashboardViewModelType
    private let router: DashboardRouting
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.isNavigationBarHidden = true
        
        setupViews()
        setupConstraints()
        registerTableViewCells()
        bind()
    }
    
    init(viewModel: DashboardViewModelType, router: DashboardRouting) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension DashboardViewController {
    
    func setupViews() {
        [headingLabel, tableView, searchButton].forEach(view.addSubview)
        tableView.backgroundColor = .appBackgroundColor
        
        let searchIcon = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        searchButton.setImage(searchIcon, for: .normal)
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            headingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.headingLabelLeading),
            headingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headingLabel.heightAnchor.constraint(equalToConstant: Constants.headingLabelHeight),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  Constants.searchIconTrailing),
            searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: Constants.searchButtonHeight),
            searchButton.widthAnchor.constraint(equalTo: searchButton.heightAnchor),
            
            tableView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func registerTableViewCells(){
        tableView.register(DashboardTableViewCell.self, forCellReuseIdentifier: DashboardTableViewCell.reuseIdentifier)
    }
    
    func createFooterLoader()-> UIView {
        let footerSpinner = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerSpinner.center
        footerSpinner.addSubview(spinner)
        spinner.startAnimating()
        
        return footerSpinner
    }
}

fileprivate extension DashboardViewController {
    
    func bind(){
        viewModel
            .outputs
            .reloadTableView
            .subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.tableView.tableFooterView = nil
                }
        }).disposed(by: disposeBag)
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputs.numberOfCells(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DashboardTableViewCell.reuseIdentifier, for: indexPath) as! DashboardTableViewCell
        cell.configure(with: viewModel.outputs.getCellViewModel(for: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.router.navigateToDetails(data: viewModel.outputs.getDetails(for: indexPath.row), navigationController: self.navigationController!)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView.scrollPercentage > 0.8 {
            self.viewModel.inputs.bringNewData.onNext(())
            self.tableView.tableFooterView = createFooterLoader()
        }
    }
}

