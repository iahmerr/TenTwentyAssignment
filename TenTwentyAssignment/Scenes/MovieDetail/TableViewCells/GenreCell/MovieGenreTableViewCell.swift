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
        static let collectionViewTopAnchor: CGFloat = 20
        static let collectionViewBottomAnchor: CGFloat = -10
        static let collectionViewHeightAnchor: CGFloat = 220
        static let collectionViewCellSize = CGSize(width: 100, height: 30)
        static let collectionViewMinimumLineSpacing: CGFloat = 14
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = Constants.collectionViewContentInset
        collectionView.backgroundColor = .appBackgroundColor
        return collectionView
    }()
    
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
        [collectionView].forEach(addSubview)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 50),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
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
