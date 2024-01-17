//
//  BookViewController.swift
//  APIPractice
//
//  Created by 은서우 on 2024/01/17.
//

import UIKit

class BookViewController: UIViewController {

    @IBOutlet var BookCollectionView: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    
    let bookmanager = BookAPIManager()
    var bookList: [Document] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: BookCollectionViewCell.identifier, bundle: nil)
        BookCollectionView.register(xib, forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
        
       bookmanager.callRequest(text: "책") { list in
           self.bookList = list
           self.BookCollectionView.reloadData()
        }
        
        configureView()
        configureCollectionCell()
        
    }
    
    func configureView(){
        BookCollectionView.delegate = self
        BookCollectionView.dataSource = self
        searchBar.searchBarStyle = .minimal
    }
    
    func configureCollectionCell(){
        let layout = UICollectionViewFlowLayout()
        let cellWidth = UIScreen.main.bounds.width/2
        let cellHeight = cellWidth
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        BookCollectionView.collectionViewLayout = layout
    }
    
}


extension BookViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        bookmanager.callRequest(text: searchText) { list in
            self.bookList = list
            self.BookCollectionView.reloadData()
         }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
}

extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath) as! BookCollectionViewCell
        
        cell.setData(data: bookList[indexPath.item])
        
        return cell
    }
}
