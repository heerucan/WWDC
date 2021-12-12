//
//  ViewController.swift
//  DiffableDataSource-Practice
//
//  Created by Thisisme Hi on 2021/12/01.
//

import UIKit

class ViewController: UIViewController {
    
    // 섹션 부분
    enum Section {
      case main, feed, post
    }
    
    // 아이템 부분

    struct Feed: Hashable {
        var id = UUID()
        var name: String
        var content: String
        
        init(name: String, content: String) {
            self.name = name
            self.content = content
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func == (lhs: Feed, rhs: Feed) -> Bool {
            lhs.id == rhs.id
        }
    }

    public let feedArray = [
        Feed(name: "루희", content: "밥을 먹는 건 참 좋은데, 왜 요새 살이 너무 쪄서 내일은 진짜 물단식을 해볼까해."),
        Feed(name: "루희", content: "밥을 먹는 건 참 좋은데, 왜 요새 살이 너무 쪄서 내일은 진짜 물단식을 해볼까해."),
        Feed(name: "만동", content: "소연이는 만동이다. 만동이~~ 왜냐하면 오라버니의 이름이 만수이기 때문이다."),
        Feed(name: "루희", content: "밥을 먹는 건 참 좋은데, 왜 요새 살이 너무 쪄서 내일은 진짜 물단식을 해볼까해."),
        Feed(name: "루희", content: "밥을 먹는 건 참 좋은데, 왜 요새 살이 너무 쪄서 내일은 진짜 물단식을 해볼까해.")
    ]
    
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var mainCV: UICollectionView!
    
    // MARK: - Property
    
//    var feed = Feed
    
    // MARK: - Typealias for DiffableDataSource + Snapshot
    
    /// 데이터 소스 부분 : 테이블뷰니까 UITableViewDataSource를 대체하는 것
    /// 스냅샷 부분 : 현재의 데이터 상태를 가져오는 것
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Feed>
    typealias DataSourceSnapShot = NSDiffableDataSourceSnapshot<Section, Feed>
    
    private var dataSource: DataSource!
    private var snapshot = DataSourceSnapShot()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
//        print("feedArray count", feed.feedArray.count)
    }
}

extension ViewController {
    func configureDataSource() {
        
        let cellRegister = UICollectionView.CellRegistration<MainCell, Feed> { (cell, indexPath, feed) in
            
        }
        
        // MARK: - 데이터소스 설정하기
        
        dataSource = UICollectionViewDiffableDataSource<Section, Feed>(collectionView: mainCV) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Feed) -> UICollectionViewCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegister, for: indexPath, item: itemIdentifier)
        }
        
        snapshot.appendSections([.feed])
        snapshot.appendItems(feedArray, toSection: .feed)
        dataSource.apply(snapshot)
    }
}

