//
//  ItemListViewController.swift
//  SidelineSwapChallenge
//
//  Created by Gershy Lev on 9/13/20.
//  Copyright © 2020 Gershy Lev. All rights reserved.
//

import UIKit
import SDWebImage

class ItemListViewController: UIViewController {

    var items = [Item]()
    var pagingInfo: Paging?
    var isFetchingNextPage: Bool = false
    var searchTerm: String {
        return searchBar.text ?? ""
    }
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getItems(searchTerm: "", page: 1)
    }
    
    func getItems(searchTerm: String, page: Int) {
        SidelineSwapAPI().getItems(searchTerm: searchTerm, page: page) { (items, error, pagingInfo) in
            DispatchQueue.main.async {
                self.loadingIndicator.stopAnimating()
                guard error == nil else {
                    self.showErrorAlert(errorDescription: error!.localizedDescription)
                    return
                }
                self.isFetchingNextPage = false
                self.pagingInfo = pagingInfo
                if let items = items {
                    self.items.append(contentsOf: items)
                    let indexPaths = (self.items.count - items.count ..< self.items.count).map { IndexPath(row: $0, section: 0) }
                    self.collectionView.insertItems(at: indexPaths)
                }
            }
        }
    }
    
    func showErrorAlert(errorDescription: String) {
        let alertController = UIAlertController(title: "Error", message: errorDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let reachedLoadPoint = scrollView.contentOffset.y >= 0
            && scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height) * 0.75
        if reachedLoadPoint, !isFetchingNextPage, let pagingInfo = pagingInfo, pagingInfo.hasNextPage {
            isFetchingNextPage = true
            getItems(searchTerm: searchTerm, page: pagingInfo.page + 1)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if searchBar.isFirstResponder {
            searchBar.resignFirstResponder()
        }
    }
}

extension ItemListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let indentifier = "ItemCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifier, for: indexPath) as! ItemCollectionViewCell
        let item = items[indexPath.row]
        cell.sellerNameLabel.text = item.seller?.username
        cell.titleLabel.text = item.name
        cell.priceLabel.text = String(format: "$%.02f", item.price)
        cell.itemImageView.sd_imageTransition = .fade
        cell.itemImageView.sd_setImage(with: URL(string: item.primaryImage.thumbUrl!), placeholderImage: UIImage(named: "sidelineswap"), options: SDWebImageOptions(rawValue: 0), completed: nil)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (UIScreen.main.bounds.size.width - 30) / 2
        return CGSize(width: itemWidth, height: itemWidth * 1.5)
    }
}

extension ItemListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        items.removeAll()
        self.collectionView.reloadData()
        loadingIndicator.startAnimating()
        getItems(searchTerm: searchText, page: 1)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


