//
//  ViewController.swift
//  Publisher
//
//  Created by SurbineHuang on 7/5/21.
//

import UIKit
import MJRefresh
import DTZFloatingActionButton

class ArticleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // 下拉新增 refresh 畫面
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.tableView.mj_header?.endRefreshing()
            self.loadArticles()
        })
        
        // 增加 floating buutton
        let actionButton = DTZFloatingActionButton()
        actionButton.handler = { button in
            self.performSegue(withIdentifier: "AddArticle", sender: self)
        }
        actionButton.isScrollView = true
        self.view.addSubview(actionButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.loadArticles()
    }
    
    func loadArticles() {
        ArticleManager.shared.getArticles { [weak self] result in
            switch result {
            
            case .success(let articles):
                
                self?.articles = articles
                self?.tableView.reloadData()
                
            case .failure(let error):
                
                print("loadArticles.failure: \(error)")
            }
        }
    }
}

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let article = self.articles[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell {
            
            cell.setData(title: article.title,
                         name: article.author.name,
                         createdTime: article.createdTime,
                         category: article.category,
                         content: article.content)
            return cell
        }
        
        return UITableViewCell()
    }
}
