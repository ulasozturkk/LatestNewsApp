//
//  ShowEveryArticlesVC.swift
//  NewsApp
//
//  Created by macbook pro on 10.12.2023.
//

import UIKit

class ShowEveryArticlesVC: UIViewController, selectParametersDelegate , EverythingDelegate{
    
    
    let tableview = UITableView()
    let searchBar = UISearchBar()
    var everyArticles : [Article] = []
    let vm = EverythingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableview.register(EverythingCell.self, forCellReuseIdentifier: "everyThingCell")
        vm.delegate = self
        tableview.delegate = self
        tableview.dataSource = self
        setup()
        
    }
    func getEveryData(articles: [Article]) {
        DispatchQueue.main.async {
            self.everyArticles = articles
            self.tableview.reloadData()
        }
    }
    
    func selectEveryParams(q: String?, language: String?, toDate: String?, fromDate: String?) {
        DispatchQueue.main.async {
            self.vm.createRequest(q: q, language: language,from: fromDate, to: toDate)
        }
    }
    
    func setup(){
        searchBar.placeholder = "search..."
        view.addSubViews(tableview,searchBar)
        searchBar.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.safeAreaLayoutGuide.leadingAnchor,width: view.safeAreaLayoutGuide.widthAnchor)
        tableview.anchor(top:searchBar.bottomAnchor, width:view.safeAreaLayoutGuide.widthAnchor, height: view.safeAreaLayoutGuide.heightAnchor,widthMultiplier:1,heightMultiplier: 1)
    }
    

    
}

extension ShowEveryArticlesVC: UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return everyArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "everyThingCell", for: indexPath) as! EverythingCell
        cell.item = everyArticles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenheight = UIScreen.main.bounds.height
        return screenheight * 0.15
    }
    
}
