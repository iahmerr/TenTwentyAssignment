//
//  DashboardTableViewCell.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 14/07/2022.
//

import UIKit

class DashboardTableViewCell: ReusableTableViewCell {

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
