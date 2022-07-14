//
//  UITableView+Extension.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 14/07/2022.
//

import Foundation
import UIKit

public extension UITableView {
    var scrollPercentage: CGFloat {
        let height = self.contentSize.height - self.frame.size.height
            let scrolledPercentage = self.contentOffset.y / height
            return scrolledPercentage
    }
}
