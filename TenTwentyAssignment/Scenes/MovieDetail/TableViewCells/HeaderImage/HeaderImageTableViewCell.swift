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
        static let stackLeading: CGFloat = 30
        static let stackTrailing: CGFloat = -30
        static let stackBottom: CGFloat = -30
        static let stackItemsHeight: CGFloat = 45
        static let stackButtonsCornerRadius: CGFloat = 10
    }
    
    lazy var headerImage: UIImageView = UIImageViewFactory.createImageView(mode: .scaleToFill)
    lazy var releaseDateLabel: UILabel = UILabelFactory.createUILabel(with: .white, textStyle: .large, fontWeight: .black, alignment: .center, numberOfLines: 0)
    lazy var trailerButton: UIButton = UIButtonFactory.createButton(title: "Watch Trailer" ,backgroundColor: .clear, textColor: .white)
    lazy var buyTicketButton: UIButton = UIButtonFactory.createButton(title: "Get Tickets", backgroundColor: .clear, textColor: .white)
    lazy var stack = UIStackViewFactory.createStackView(with: .vertical, alignment: .fill, distribution: .fillEqually, spacing: 5, arrangedSubviews: [releaseDateLabel, buyTicketButton, trailerButton])
    
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
        trailerButton.titleLabel?.font = UIFont.appFont(ofSize: 16, weigth: .bold, theme: .main)
        buyTicketButton.titleLabel?.font = UIFont.appFont(ofSize: 16, weigth: .bold, theme: .main)
        buyTicketButton.layer.cornerRadius = Constants.stackButtonsCornerRadius
        trailerButton.layer.cornerRadius = Constants.stackButtonsCornerRadius
        buyTicketButton.backgroundColor = UIColor.appColor(ofType: .skyBlueColor)
        trailerButton.layer.borderColor = UIColor.appColor(ofType: .skyBlueColor).cgColor
        trailerButton.addImage(image: UIImage(systemName: "play.fill")!)
        trailerButton.layer.borderWidth = 1
        [headerImage, stack].forEach(addSubview)
        DispatchQueue.main.async {
            self.headerImage.addGradient()
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImage.topAnchor.constraint(equalTo: topAnchor),
            headerImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerImage.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.stackLeading),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.stackTrailing),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.stackBottom),
            buyTicketButton.heightAnchor.constraint(equalToConstant: Constants.stackItemsHeight)
        ])
    }
    
    func bind() {
        viewModel.outputs.image.bind(to: headerImage.rx.loadImage()).disposed(by:disposeBag)
        viewModel.outputs.releaseDate.bind(to: releaseDateLabel.rx.text).disposed(by: disposeBag)
    }
}
