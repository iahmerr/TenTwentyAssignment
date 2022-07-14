//
//  DashboardTableViewCell.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 14/07/2022.
//

import UIKit
import RxSwift

final class DashboardTableViewCell: ReusableTableViewCell {
    
    private enum Constants {
        static let imageAllSides: CGFloat = 20
        static let imageViewCornerRadius: CGFloat = 20
        static let imageHeight: CGFloat = 200
        static let titleLabelLeadingTrailing: CGFloat = 40
        static let titleLabelBottom: CGFloat = -40
    }

    private let backgroundImage: UIImageView = UIImageViewFactory.createImageView(mode: .scaleToFill)
    private let titleLabel: UILabel = UILabelFactory.createUILabel(with: .white, textStyle: .large, fontWeight: .semibold)
    
    private var viewModel: DashboardTableViewCellViewModelType!
    private let disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        backgroundImage.layer.cornerRadius = Constants.imageViewCornerRadius
    }
    
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? DashboardTableViewCellViewModelType else { return }
        self.viewModel = viewModel
        
        setupViews()
        setupConstraints()
        bindViews()
    }
}

fileprivate extension DashboardTableViewCell {
    
    func setupViews(){
        [backgroundImage, titleLabel].forEach(addSubview)
        backgroundColor = .appBackgroundColor
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.imageAllSides),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.imageAllSides),
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: Constants.imageAllSides),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.imageAllSides),
            backgroundImage.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.titleLabelLeadingTrailing),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.titleLabelLeadingTrailing),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.titleLabelBottom)
        ])
    }
    
    func bindViews() {
        viewModel.outputs.labelText.bind(to: titleLabel.rx.text).disposed(by: disposeBag)
        viewModel.outputs.backgroundImage.bind(to: backgroundImage.rx.loadImage(true)).disposed(by: disposeBag)
    }
}
