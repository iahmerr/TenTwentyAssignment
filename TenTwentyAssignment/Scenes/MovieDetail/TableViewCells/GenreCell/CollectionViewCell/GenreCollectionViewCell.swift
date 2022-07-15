//
//  GenreCollectionViewCell.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import UIKit

final class GenreCollectionViewCell: ReusableCollectionViewCell {
    
    private enum Constants {
        static let genreLabelAllSides: CGFloat = 5
    }
    
    private lazy var genreLabel: UILabel = UILabelFactory.createUILabel(with: .white, textStyle: .small, fontWeight: .medium, alignment: .center, numberOfLines: 0, text: "Comedy")
    
    private var viewModel: GenreCollectionViewCellViewModelType!
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? GenreCollectionViewCellViewModelType else { return }
        self.viewModel = viewModel
        
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        genreLabel.layer.masksToBounds = true
        genreLabel.layer.cornerRadius = genreLabel.frame.height/2
    }
    
}

fileprivate extension GenreCollectionViewCell {
    
    func setupViews() {
        [genreLabel].forEach(addSubview)
        genreLabel.backgroundColor = .getRandomColor
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.genreLabelAllSides),
            genreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.genreLabelAllSides),
            genreLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.genreLabelAllSides),
            genreLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.genreLabelAllSides)
        ])
    }
}
