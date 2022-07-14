//
//  DashboardTableViewCell.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 14/07/2022.
//

import UIKit

class DashboardTableViewCell: ReusableTableViewCell {
    
    private enum Constants {
        static let imageAllSides: CGFloat = 5
        static let titleLabelLeadingTrailingBottom: CGFloat = 20
    }

    private let backgroundImage: UIImageView = UIImageViewFactory.createImageView()
    private let titleLabel: UILabel = UILabelFactory.createUILabel()
    
    private var viewModel: DashboardTableViewCellViewModelType!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? DashboardTableViewCellViewModelType else { return }
        self.viewModel = viewModel
    }
}

fileprivate extension DashboardTableViewCell {
    
    func setupViews(){
        [backgroundImage, titleLabel].forEach(addSubview)
        backgroundColor = .appBackgroundColor
    }
    
    func setupConstraints(){
        
        backgroundImage.pin(to: contentView, padding: (Constants.imageAllSides,Constants.imageAllSides,Constants.imageAllSides,Constants.imageAllSides))
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.titleLabelLeadingTrailingBottom),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.titleLabelLeadingTrailingBottom),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.titleLabelLeadingTrailingBottom)
        ])
    }
    
    func bindViews() {
        
    }
}
