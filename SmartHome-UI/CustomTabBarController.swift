//
//  customTabBarController.swift
//  UIDesign
//
//  Created by iPHTech34 on 03/07/24.
//

import UIKit

class CustomTabBarController: UITabBarController {

    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.backgroundColor = UIColor.systemPink
        button.layer.cornerRadius = 35
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
        self.setupAddButton()
    }

    private func setupTabBar() {
        let customTabBar = CurvedTabBar()
        self.setValue(customTabBar, forKey: "tabBar")
    }

    private func setupAddButton() {
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: tabBar.topAnchor, constant: -10),
            addButton.widthAnchor.constraint(equalToConstant: 70),
            addButton.heightAnchor.constraint(equalToConstant: 70)
        ])

        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }

    @objc private func addButtonTapped() {
      
    }
}
