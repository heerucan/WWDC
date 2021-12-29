//
//  VideosViewController.swift
//  DiffableDataSource-Practice
//
//  Created by Thisisme Hi on 2021/12/13.
//

import UIKit

class VideosViewController: UIViewController {
    
    enum Section {
      case main
    }
    
    private var videoList = Video.allVideos
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Video>!
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Video>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Search Video"
        configureDataSource()
        configureSearchBar()
        applySnapshot(with: nil)
    }
}

extension VideosViewController {
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<VideoCollectionViewCell, Video> { (cell, indexPath, video) in
            cell.video = video
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Video>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Video) -> UICollectionViewCell? in
            // Return the cell.
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
    }
    
    func applySnapshot(with searchQuery: String?) {
        var filteredVideo: [Video]
        if let searchQuery = searchQuery, !searchQuery.isEmpty {
            filteredVideo = videoList.filter { $0.title.contains(searchQuery) }
        } else {
            filteredVideo = videoList
        }
        
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(filteredVideo, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func configureSearchBar() {
        searchBar.placeholder = "Search Videos"
        searchBar.delegate = self
    }
}

extension VideosViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        applySnapshot(with: searchText)
    }
}

