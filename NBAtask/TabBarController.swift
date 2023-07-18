//
//  TabBarController.swift
//  NBAtask
//
//  Created by Viktor Krastev on 9.07.23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create view controllers for each tab
        let firstViewController = FirstViewController()
        let secondViewController = SecondViewController()
        let thirdViewController = ThirdViewController()
        
        // Set the view controllers for the tab bar controller
        self.viewControllers = [firstViewController, secondViewController, thirdViewController]
        
        // Customize the tab bar appearance
        self.tabBar.tintColor = UIColor.red
        self.tabBar.barTintColor = UIColor.white
    }
    


}


class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        title = "First"
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        title = "Second"
    }
}

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        title = "Third"
    }
}
