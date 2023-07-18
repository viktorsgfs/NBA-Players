//
//  AboutViewController.swift
//  NBAtask
//
//  Created by Viktor Krastev on 16.07.23.
//

import UIKit

class AboutViewController: UIViewController, AboutBaseCoordinated {
    
    weak var coordinator: AboutBaseCoordinator?
    
    init(coordinator: AboutBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "About"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.configureView()
    }
    
    private func configureView() {

        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let versionLabel = UILabel()
        versionLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 80)
        self.view.addSubview(versionLabel)
        
        versionLabel.textAlignment = .center
        versionLabel.font = UIFont(name: "Roboto", size: 22)
        versionLabel.center = self.view.center
        versionLabel.text = "App version \n \n \(appVersion ?? "1").20230718"
        versionLabel.numberOfLines = 0
        
    }
//    private func configureButton() {
//        goToOrders2button = UIButton()
//        view.addSubview(goToOrders2button)
//        goToOrders2button.translatesAutoresizingMaskIntoConstraints = false
//
//        goToOrders2button.setTitle(" Go to Orders 2 ", for: .normal)
//        goToOrders2button.layer.borderColor = UIColor.black.cgColor
//        goToOrders2button.layer.borderWidth = 2
//        goToOrders2button.backgroundColor = .black
//        goToOrders2button.addTarget(self, action: #selector(goToHome2), for: .touchUpInside)
//
//        NSLayoutConstraint.activate([
//            goToOrders2button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            goToOrders2button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
//    }
    
    
}
