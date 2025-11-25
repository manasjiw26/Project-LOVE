//
//  ExploreViewController.swift
//  Project LOVE
//
//  Created by SDC-USER on 19/11/25.
//

import UIKit

class ExploreViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet var activity_collection: UICollectionView!
    var rewards: [Reward] = []
    var activity: [Activity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewards = dataStore.rewards
        activity = dataStore.activities
        
        registerCell()
        
        activity_collection.setCollectionViewLayout(generateLayout(), animated: true)
        activity_collection.dataSource = self
        activity_collection.delegate = self
    }
    
    func registerCell() {
        activity_collection.register(UINib(nibName: "RewardsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "reward_cell")
        
        activity_collection.register(UINib(nibName: "ActivityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "activity_cell")
        
        activity_collection.register(UINib(nibName: "ActivitySectionHeaderViewCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header_cell")
        
    }
    
    func generateLayout()->UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { section, env in
            
            if section == 0 { //Rewards
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)   // enough for circle + label
                )

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(100),
                    heightDimension: .absolute(120)
                )
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.interItemSpacing = .fixed(24)
                group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                
                return section
            } else { //Activities
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1))
                //create item
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(300))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
                
                
                let section = NSCollectionLayoutSection(group: group)
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(70))
            
                let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            
                section.boundarySupplementaryItems = [headerItem]
            
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.interGroupSpacing = 10
                
                //add spaces from edges to content
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                return section
            }
        }
        return layout
    }
}

extension ExploreViewController:  UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return rewards.count
        }
        return activity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = activity_collection.dequeueReusableCell(withReuseIdentifier: "reward_cell", for: indexPath) as! RewardsCollectionViewCell
            let reward = rewards[indexPath.row]
            cell.configureCell(reward: reward)
            return cell
        } else {
            let cell = activity_collection.dequeueReusableCell(withReuseIdentifier: "activity_cell", for: indexPath) as! ActivityCollectionViewCell
            let activity = activity[indexPath.row]
            cell.configureCell(activity: activity)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section != 0{
            let header = activity_collection.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header_cell", for: indexPath) as! ActivitySectionHeaderViewCollectionReusableView
            
            header.titleLabel.text = "Activities"
            
            return header
        }
        return UICollectionReusableView()
    }
    
}
