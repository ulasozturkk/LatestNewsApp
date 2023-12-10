//
//  ShowTopArticlesVC.swift
//  NewsApp
//
//  Created by macbook pro on 10.12.2023.
//

import UIKit

class ShowTopArticlesVC: UIViewController , chooseParameterProtocol, articlesDelegate{
    
    var TopArticles : [Article] = []
    var articleTitles : [String] = []
    var filteredArticle : [String] = []
    let vm = TopHeadlinesViewModel()
    
    func sendParameters(country: String, category: String?, fromdate: String?, todate: String?) {
        print("sendparameters çalıştı")
        DispatchQueue.main.async {
            self.vm.createRequest(country: country,from: fromdate,to: todate,category: category)
        }
    }
    func articles(articles: [Article]) {
        DispatchQueue.main.async {
            self.TopArticles = articles
            for item in articles {
                self.articleTitles.append(item.title!)
            }
            self.tableview.reloadData()
        }
    }


    let tableview = UITableView()
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        print("viewdidload çalıştı")
        super.viewDidLoad()
        tableview.register(TopHeadlinesCell.self, forCellReuseIdentifier: "topHeadlinesCell")
        view.backgroundColor = .white
        setup()
        vm.delegate = self
        searchBar.delegate = self
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    func setup(){
        searchBar.placeholder = "search..."
        view.addSubViews(tableview,searchBar)
        searchBar.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.safeAreaLayoutGuide.leadingAnchor,width: view.safeAreaLayoutGuide.widthAnchor)
        tableview.anchor(top:searchBar.bottomAnchor, width:view.safeAreaLayoutGuide.widthAnchor, height: view.safeAreaLayoutGuide.heightAnchor,widthMultiplier:1,heightMultiplier: 1)
    }
    
    
}

extension ShowTopArticlesVC :UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArticle = searchText.isEmpty ? articleTitles : articleTitles.filter { $0.contains(searchText)}
        print(filteredArticle)
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TopArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topHeadlinesCell", for: indexPath) as! TopHeadlinesCell
        cell.item = TopArticles[indexPath.row]
        return cell
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            print(searchText)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenheight = UIScreen.main.bounds.height
        return screenheight * 0.15
    }
}
