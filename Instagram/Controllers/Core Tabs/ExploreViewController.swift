//
//  ExploreViewController.swift
//  Instagram
//
//  Created by JOEL CRAWFORD on 7/6/21.
//  Copyright © 2021 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .secondarySystemBackground
        return searchBar
    }()

    
    //Optional because we shall instantiate with flow
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.topItem?.titleView = searchBar
        
        
        let layout = UICollectionViewFlowLayout() //layout allow us to control how things are like scroll direction
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
//        layout.itemSize = CGSize(width: view.width/3, height: view.width/3) //3 columns
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        guard let collectionView  = collectionView else {
            return
        }
        
        view.addSubview(collectionView)
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView?.frame = view.bounds //entire screen
    }
    


  

}



extension ExploreViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
}
