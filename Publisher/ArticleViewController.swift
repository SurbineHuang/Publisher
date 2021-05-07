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
    
    var articles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // reload 畫面
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.tableView.mj_header?.endRefreshing()
        })
        
        
        let actionButton = DTZFloatingActionButton()
                actionButton.handler = {
                    button in
                    print("Hi!")
                }
                actionButton.isScrollView = true
                self.view.addSubview(actionButton)
    }


    
}

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
//        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell {
            
            
            return cell
        }
        
        return UITableViewCell()
    }
}

