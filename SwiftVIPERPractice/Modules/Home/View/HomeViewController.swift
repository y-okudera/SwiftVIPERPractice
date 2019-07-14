//
//  HomeViewController.swift
//  SwiftVIPERPractice
//
//  Created by Yuki Okudera on 2019/07/13.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit
import SwiftVIPERPracticeDataStore

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var prefSearchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    // Presenterへのアクセスはprotocolを介して行う
    var presenter: HomeViewPresentation!
    private var libraryListDataSource = LibraryListDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prefSearchBar.delegate = self
        tableView.dataSource = libraryListDataSource
        tableView.delegate = self
        presenter.viewDidLoad()
    }
}

// Viewのプロトコルに準拠する
extension HomeViewController: HomeView {
    
    func reloadData(libraries: [Library]) {
        libraryListDataSource.set(libraries: libraries)
        tableView.reloadData()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.prefTextValueChanged(prefText: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter.prefTextValueChanged(prefText: searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}
