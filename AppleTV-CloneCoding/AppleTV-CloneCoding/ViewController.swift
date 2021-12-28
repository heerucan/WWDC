//
//  ViewController.swift
//  AppleTV-CloneCoding
//
//  Created by Thisisme Hi on 2021/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    static let titleElementKind = "titleElementKind"
    
    // MARK: - Properties
    
    private lazy var collectionView = UICollectionView (
        frame: .zero,
        collectionViewLayout: makeLayout()
    )
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Movie>!
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Movie>
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureDataSource()
        applySnapshot()
        applySnapshot()
    }
    
    private func configure() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - Compositional Layout

extension ViewController {
    private func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnv: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            switch sectionKind {
            case .Big:
                
                return self.createBigCellSection()
                
            case .Middle:
                return self.createSmallCellSection()
                
            case .Small:
                return self.createMiddleCellSection()
                
            case .Nano:
                return self.createSmallCellSection()
                
            default:
                return nil
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        
        return layout
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(38))
        
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: ViewController.titleElementKind,
            alignment: .top)
        return layoutSectionHeader
    }
    
    private func createBigCellSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(338),
            heightDimension: .estimated(453))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 32, leading: 10, bottom: 0, trailing: 32)
        return section
    }
    
    private func createMiddleCellSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(220),
            heightDimension: .estimated(126))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let sectionHeader = self.createSectionHeader()
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    private func createSmallCellSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(163),
            heightDimension: .estimated(92))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let sectionHeader = self.createSectionHeader()
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
}

// MARK: - Diffable DataSource + Apply

extension ViewController {
    private func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration
        <PosterCollectionViewCell, Movie> { (cell, indexPath, movie) in
            cell.movie = movie
        }
        
        dataSource = UICollectionViewDiffableDataSource
        <Section, Movie>(collectionView: collectionView) {
            collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: itemIdentifier)
        }
        
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration
        <TitleSupplementaryView>(elementKind: ViewController.titleElementKind) {
            (supplementaryView, string, indexPath) in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section") }
            switch section {
            case .Big, .Nano: break
                
            case .Middle:
                supplementaryView.titleLabel.text = "좋은 영화 착한 가격"
                supplementaryView.button.setTitle("전체보기", for: .normal)
                
            case .Small:
                supplementaryView.titleLabel.text = "할인가로 즐기는 연말에 볼만한 영화"
                supplementaryView.button.setTitle("전체보기", for: .normal)
        
            }
        }
        
        dataSource.supplementaryViewProvider = { (view, kind, index) in
            return self.collectionView.dequeueConfiguredReusableSupplementary(
                using: supplementaryRegistration, for: index)
        }
    }
    
    private func applySnapshot() {
 
        let sections = Section.allCases
        var snapShot = Snapshot()
        snapShot.appendSections(sections)

        snapShot.appendItems(Movie.allBigMovies, toSection: .Big)
        snapShot.appendItems(Movie.allMiddleMovies, toSection: .Middle)
        snapShot.appendItems(Movie.allSmallMovies, toSection: .Small)
        snapShot.appendItems(Movie.allNanoMovies, toSection: .Nano)

        dataSource.apply(snapShot, animatingDifferences: false)
    }
}
