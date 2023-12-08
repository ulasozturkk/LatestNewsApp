//
//  ViewController.swift
//  NewsApp
//
//  Created by macbook pro on 8.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        view.backgroundColor = .yellow
        super.viewDidLoad()
        getdata()
    }
    
    func getdata(){ 
        DispatchQueue.main.async {
            let myendpoint = HomePageService.shared.setTopEndpoint(country: "tr")
            print("endpoint oluşturuldu request atılıyor")
            let request = HomePageService.shared.getTopHeadlineArticles(endpoint: myendpoint) { res in
                print("req atıldı sonuç döndü")
                switch res{
                case .success(let models):
                    print(models)
                case .failure(let err):
                    print(err)
                }
            }
        }
    }

}

