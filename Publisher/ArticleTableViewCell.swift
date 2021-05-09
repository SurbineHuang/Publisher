//
//  ArticleTableViewCell.swift
//  Publisher
//
//  Created by SurbineHuang on 7/5/21.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(title: String, name: String, createdTime: TimeInterval, category: String, content: String) {
        
        let date = Date(timeIntervalSince1970: createdTime)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd HH:mm"
        let dateString = dateFormatter.string(from: date)
        
        self.titleLabel.text = title
        self.nameLabel.text = name
        self.timeLabel.text = dateString
        self.categoryLabel.text = category
        self.contentLabel.text = content
    }
}
