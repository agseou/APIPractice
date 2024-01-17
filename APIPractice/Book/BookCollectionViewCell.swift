//
//  BookCollectionViewCell.swift
//  APIPractice
//
//  Created by 은서우 on 2024/01/17.
//

import UIKit
import Kingfisher

class BookCollectionViewCell: UICollectionViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var CardView: UIView!
    let bookmanager = BookAPIManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = .boldSystemFont(ofSize: 17)
        titleLabel.textColor = .white
        imageView.contentMode = .scaleAspectFill
        
        CardView.layer.cornerRadius = 15
        CardView.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: .random(in: 0.5...1))
    }

    func setData(data: Document){
        let url = URL(string: data.thumbnail)
        imageView.kf.setImage(with: url)
        titleLabel.text = data.title
    }
}
