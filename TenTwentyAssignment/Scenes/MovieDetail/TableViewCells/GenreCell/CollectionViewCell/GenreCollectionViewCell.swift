//
//  GenreCollectionViewCell.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import UIKit

final class GenreCollectionViewCell: ReusableCollectionViewCell {
    
    private enum Constants {
        static let genreLabelAllSides: CGFloat = 10
    }
    
    private lazy var genreLabel: UILabel = UILabelFactory.createUILabel(with: .white, textStyle: .small, fontWeight: .light, alignment: .center, numberOfLines: 0, text: "Comedy")
    
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
        
        genreLabel.backgroundColor = .getRandomColor
        genreLabel.layer.cornerRadius = genreLabel.frame.height/2
    }
    
}

fileprivate extension GenreCollectionViewCell {
    
    func setupViews() {
        [genreLabel].forEach(addSubview)
    }
    
    func setupConstraints() {
        genreLabel
            .pin(to: contentView,
                 padding: (Constants.genreLabelAllSides,
                           Constants.genreLabelAllSides,
                           Constants.genreLabelAllSides,
                           Constants.genreLabelAllSides))
    }
}
