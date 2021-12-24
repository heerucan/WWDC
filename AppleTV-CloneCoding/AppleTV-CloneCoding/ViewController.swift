//
//  ViewController.swift
//  AppleTV-CloneCoding
//
//  Created by Thisisme Hi on 2021/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        setupAutoLayout()
    }
    
    // MARK: - UI & Layout
    
    private func configureDataSource() {
        
    }
    
    func setupAutoLayout() {
        
    }
    
    // MARK: - Custom Method

}

