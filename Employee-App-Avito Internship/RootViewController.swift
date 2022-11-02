//
//  RootViewController.swift
//  Employee-App-Avito Internship
//
//  Created by Adlet Zhantassov on 02.11.2022.
//

import UIKit

class RootViewController: UIViewController {
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AVITO"
        view.backgroundColor = .systemBackground
        setupView()
    }
    
    func setupView() {
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.setTitle("Load JSON Data", for: .normal)
        button.layer.cornerRadius = 10
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        let destinationVC = ViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }


}
