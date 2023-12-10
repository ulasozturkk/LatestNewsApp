//
//  ShowTopArticlesVC.swift
//  NewsApp
//
//  Created by macbook pro on 10.12.2023.
//

import UIKit

class ShowTopArticlesVC: UIViewController , chooseParameterProtocol {
    func sendParameters(country: String, category: String?, fromdate: String?, todate: String?) {
        print(country,category,fromdate,todate)
    }
    
    
    // önceki sayfadan gelen değerlere göre query atılacak
    // tableview ve searchbar olacak
    // filtreleme olacak, mümkün mertebe apiden
    // haberin birine tıklandığında detay sayfasına geçecek

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    

}
