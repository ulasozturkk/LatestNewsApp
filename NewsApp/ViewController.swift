//
//  ViewController.swift
//  NewsApp
//
//  Created by macbook pro on 8.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var arr = [Any]()
    override func viewDidLoad() {
        view.backgroundColor = .yellow
        super.viewDidLoad()
        getdata()
    }
    
    func getdata(){ 
        DispatchQueue.main.async {
            let myendpoint = HomePageService.shared.createEndPoint(type: "everything",q:"tesla",from: "2023-12-08",to: "2023-12-09")
            print("endpoint oluşturuldu request atılıyor")
            let request = HomePageService.shared.getArticles(endpoint: myendpoint) { res in
                switch res{
                case .success(let data):
                    print(data.articles[5].urlToImage)
                case .failure(let err):
                    print(err)
                }
            }
        }
    }

}

