//
//  MainCell.swift
//  DiffableDataSource-Practice
//
//  Created by Thisisme Hi on 2021/12/13.
//

import UIKit

class MainCell: UICollectionViewCell {
    static let identifier = "MainCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
