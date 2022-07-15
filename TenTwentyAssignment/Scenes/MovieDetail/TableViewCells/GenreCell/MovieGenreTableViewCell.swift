//
//  MovieGenreTableViewCell.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import UIKit

class MovieGenreTableViewCell: ReusableTableViewCell {
    
    private enum Constants {
        static let collectionViewContentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 20)
        static let headerLabelTopAnchor: CGFloat = 20
        static let headerLabelLeadingAnchor: CGFloat = 30
        static let collectionViewTopAnchor: CGFloat = 5
        static let collectionViewBottomAnchor: CGFloat = -10
        static let collectionViewLeadingAnchor: CGFloat = 10
        static let collectionViewTrailingAnchor: CGFloat = -10
        static let collectionViewHeightAnchor: CGFloat = 50
        static let collectionViewCellSize = CGSize(width: 100, height: 30)
        static let collectionViewMinimumLineSpacing: CGFloat = 14
        static let titleLabelTopAnchor: CGFloat = 30
        static let titleLabelLeadingAnchor: CGFloat = 20
        static let titleLabelTrailingAnchor: CGFloat = -20
        static let titleLabelHeightAnchor: CGFloat = 20
    }
    
    private lazy var titleLabel: UILabel = UILabelFactory.createUILabel(with: .black, textStyle: .small, fontWeight: .semibold, alignment: .left, text: "Genres")
    
    private lazy var collectionView: UICollectionView = UICollectionViewFactory.createUICollectionView()
    
    private var viewModel: MovieGenreTableViewCellViewModelType!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? MovieGenreTableViewCellViewModelType else { return }
        self.viewModel = viewModel
        contentView.isUserInteractionEnabled = false
        
        setupViews()
        setupConstraints()
        registerCollectionViewCell()
    }
    
}

fileprivate extension MovieGenreTableViewCell {
    
    func registerCollectionViewCell() {
        collectionView.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: GenreCollectionViewCell.reuseIdentifier)
    }
    
    func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = Constants.collectionViewContentInset
        [collectionView, titleLabel].forEach(addSubview)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.titleLabelLeadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.titleLabelTopAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.titleLabelTrailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.titleLabelHeightAnchor),
            
            collectionView.heightAnchor.constraint(equalToConstant: Constants.collectionViewHeightAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.collectionViewLeadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.collectionViewTrailingAnchor),
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.collectionViewTopAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.collectionViewBottomAnchor)
        ])
    }
}

extension MovieGenreTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.reuseIdentifier, for: indexPath) as! ReusableCollectionViewCell
        cell.configure(with: GenreCollectionViewCellViewModel())
        return cell
    }
}

extension MovieGenreTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constants.collectionViewCellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.collectionViewMinimumLineSpacing
    }
}
