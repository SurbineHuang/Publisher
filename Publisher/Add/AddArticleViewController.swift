//
//  AddArticleViewController.swift
//  Publisher
//
//  Created by SurbineHuang on 16/5/21.
//

import UIKit

class AddArticleViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        guard let title = self.titleTextField.text, !title.isEmpty else {
            print("Title is empty")
            return
        }

        guard let category = self.categoryTextField.text, !category.isEmpty else {
            print("Category is empty")
            return
        }

        guard let content = self.contentTextField.text, !content.isEmpty else {
            print("Content is empty")
            return
        }

        ArticleManager.shared.addArticle(title: title, category: category, content: content)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
