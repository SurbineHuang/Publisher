//
//  ArticleManager.swift
//  Publisher
//
//  Created by SurbineHuang on 7/5/21.
//

import Firebase
import FirebaseFirestore
import UIKit

struct Article {
    let author: Author
    let title: String
    let content: String
    let createdTime: TimeInterval
    let id: String
    let category: String
}

struct Author {
    let email: String
    let id: String
    let name: String
}

class ArticleManager {
    
    static let shared = ArticleManager()
    
    func getArticles(completion: @escaping (Result<[Article], Error>) -> Void) {

        var articles: [Article] = []
        
        Firestore.firestore().collection("articles").getDocuments() { (querySnapshot, err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            
            for document in querySnapshot!.documents {
            
                var author: Author?
                
                if let authorData = document.get("author") as? [String: Any],
                   let email = authorData["email"] as? String,
                   let id = authorData["id"] as? String,
                   let name = authorData["name"] as? String {
                    
                    author = Author(email: email, id: id, name: name)
                    
                }
                
                if let title = document.get("title") as? String,
                   let content = document.get("content") as? String,
                   let createdTime = document.get("createdTime") as? TimeInterval,
                   let id = document.get("id") as? String,
                   let category = document.get("category") as? String {
                    
                    let article = Article(author: author!,
                                          title: title,
                                          content: content,
                                          createdTime: createdTime,
                                          id: id,
                                          category: category)
                    
                    articles.append(article)
                }
            }
            
            completion(.success(articles))
        }
    }
    
    func addArticle(title: String, category: String, content: String) {
        
        let articles = Firestore.firestore().collection("articles")
        
        let document = articles.document()
        
        let data: [String: Any] = [
            "author": [
                "email": "wayne@school.appworks.tw",
                
                "id": "waynechen323",
                
                "name": "AKA小安老師"
            ],
            
            "title": title,
            
            "content": content,
            
            "createdTime": NSDate().timeIntervalSince1970,
            
            "id": document.documentID,
            
            "category": category
        ]
        
        document.setData(data)
    }
}
