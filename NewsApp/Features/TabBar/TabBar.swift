//
//  TabBar.swift
//  NewsApp
//
//  Created by macbook pro on 10.12.2023.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let EveryThingVC = ChooseEverythingParamsVC()
        let line = UIImage(systemName: "line.horizontal.3.decrease")
        EveryThingVC.tabBarItem = UITabBarItem(title: "Every Articles", image: line, tag: 0)
        
        let topHeadlinesVC = ChooseParamsVC()
        topHeadlinesVC.tabBarItem = UITabBarItem(title: "Top Headlines", image: line, tag: 1)
        
        self.viewControllers = [EveryThingVC,topHeadlinesVC]
        
        // Do any additional setup after loading the view.
    }
    

    
}
