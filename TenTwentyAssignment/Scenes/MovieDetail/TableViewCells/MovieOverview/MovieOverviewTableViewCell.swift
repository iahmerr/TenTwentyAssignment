//
//  MovieOverviewTableViewCell.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import UIKit
import RxSwift

class MovieOverviewTableViewCell: ReusableTableViewCell {
    
    private enum Constant {
        static let titleLabelLeading: CGFloat = 20
        static let titleLabelTrailing: CGFloat = -20
        static let titleLabelTop: CGFloat = 10
        static let titleLabelHeight: CGFloat = 30
        static let descriptionLabelLeading: CGFloat = 20
        static let descriptionLabelTrailing: CGFloat = -20
        static let descriptionLabelBottom: CGFloat = -10
    }

    let titleLabel: UILabel = UILabelFactory.createUILabel(with: .black, textStyle: .large, fontWeight: .semibold, alignment: .left, text: "Overview")
    let descriptionLabel: UILabel = UILabelFactory.createUILabel(with: .black, textStyle: .small, fontWeight: .light, alignment: .left, numberOfLines: 0)
    
    private let disposeBag = DisposeBag()
    private var viewModel: MovieOverviewTableViewCellViewModelType!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? MovieOverviewTableViewCellViewModelType else { return }
        self.viewModel = viewModel
        
        setupViews()
        setupConstraints()
        bindViews()
    }
}

fileprivate extension MovieOverviewTableViewCell {
    
    func setupViews() {
        [titleLabel, descriptionLabel].forEach(addSubview)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.titleLabelLeading),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.titleLabelTrailing),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constant.titleLabelHeight),
            titleLabel.heightAnchor.constraint(equalToConstant: Constant.titleLabelHeight),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.descriptionLabelLeading),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.descriptionLabelTrailing),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constant.descriptionLabelBottom)
        ])
    }
    
    func bindViews(){
        viewModel.outputs.overViewText.bind(to: descriptionLabel.rx.text).disposed(by: disposeBag)
    }
}
