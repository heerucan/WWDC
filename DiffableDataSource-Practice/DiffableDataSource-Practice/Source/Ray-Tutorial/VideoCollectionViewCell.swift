//
//  VideoCollectionViewCell.swift
//  DiffableDataSource-Practice
//
//  Created by Thisisme Hi on 2021/12/13.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VideoCollectionViewCell"
    
    let backView = UIView()
    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(backView)
        backView.addSubview(thumbnailImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        titleLabel.font = .boldSystemFont(ofSize: 17)
        subtitleLabel.font = .systemFont(ofSize: 17)
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.clipsToBounds = true
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 10
        let inset = CGFloat(8)
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            backView.heightAnchor.constraint(equalToConstant: 280),
            
            thumbnailImageView.topAnchor.constraint(equalTo: backView.topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            thumbnailImageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: inset),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            titleLabel.heightAnchor.constraint(equalToConstant: 22),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: inset),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }

    
    var video: Video? {
      didSet {
        thumbnailImageView.image = video?.thumbnail
        titleLabel.text = video?.title
        subtitleLabel.text = "\(video?.lessonCount ?? 0) lessons"
      }
    }
}
