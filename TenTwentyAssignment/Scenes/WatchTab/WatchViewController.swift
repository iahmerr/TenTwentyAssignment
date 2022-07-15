//
//  WatchViewController.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 13/07/2022.
//

import UIKit

class WatchViewController: UIViewController {
    
    private lazy var demoLabel: UILabel = UILabelFactory.createUILabel(text: "Yet to be implemented")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        view.addSubview(demoLabel)
        demoLabel.centerInSuperView()
    }
}
