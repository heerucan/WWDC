//
//  TitleSupplementaryView.swift
//  AppleTV-CloneCoding
//
//  Created by Thisisme Hi on 2021/12/24.
//

import UIKit

import SnapKit
import Then

class TitleSupplementaryView: UICollectionReusableView {
    
    static let identifier = "TitleSupplementaryView"

    // MARK: - Properties
    private lazy var stackView = UIStackView(arrangedSubviews: [
        titleLabel, subtitleLabel]).then {
        $0.axis = .vertical
        $0.spacing = 3
    }
    
    public let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    public let subtitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11, weight: .regular)
    }
    
    public let button = UIButton(type: .system)
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func configure() {
        addSubview(stackView)
        addSubview(button)
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(9)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(3)
            make.trailing.equalToSuperview().inset(8)
            make.width.equalTo(52)
        }
    }
}
