//
//  FeedCell.swift
//  InstagramFirestoreTutorial
//
//  Created by Junho Lee on 2022/02/16.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
