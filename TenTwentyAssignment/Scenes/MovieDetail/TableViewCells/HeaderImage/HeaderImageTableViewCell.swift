//
//  HeaderImageTableViewCell.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import UIKit
import RxSwift

final class HeaderImageTableViewCell: ReusableTableViewCell {
    
    private enum Constants {
        static let imageHeight: CGFloat = 450
    }
    
    let headerImage: UIImageView = UIImageViewFactory.createImageView(mode: .scaleToFill)
    
    private let disposeBag = DisposeBag()
    private var viewModel: HeaderImageTableViewCellViewModel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? HeaderImageTableViewCellViewModel else { return }
        self.viewModel = viewModel
        
        setupViews()
        setupConstraints()
        bind()
    }
}

fileprivate extension HeaderImageTableViewCell {

    func setupViews() {
        [headerImage].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImage.topAnchor.constraint(equalTo: topAnchor),
            headerImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerImage.heightAnchor.constraint(equalToConstant: Constants.imageHeight)
        ])
    }
    
    func bind() {
        viewModel.outputs.image.bind(to: headerImage.rx.loadImage()).disposed(by:disposeBag)
    }
}
