//
//  BigPosterCollectionViewCell.swift
//  AppleTV-CloneCoding
//
//  Created by Thisisme Hi on 2021/12/25.
//

import UIKit

class PosterCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PosterCollectionViewCell"
    
    var movie: Movie? {
      didSet {
          guard let movie = movie else { return }
          posterImageView.image = movie.poster
      }
    }
    
    // MARK: - Properties
    
    private let posterImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = false
        $0.layer.cornerRadius = 8
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowRadius = 20
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 0.3
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func configure() {
        contentView.addSubview(posterImageView)
        
        posterImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
