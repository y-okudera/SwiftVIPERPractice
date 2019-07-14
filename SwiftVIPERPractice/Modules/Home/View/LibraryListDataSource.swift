//
//  LibraryListDataSource.swift
//  SwiftVIPERPractice
//
//  Created by Yuki Okudera on 2019/07/14.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import SwiftVIPERPracticeDataStore
import UIKit

final class LibraryListDataSource: NSObject {
    private var libraries = [Library]()
    
    func set(libraries: [Library]) {
        self.libraries = libraries
    }
}

extension LibraryListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libraries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.libraryNameLabel.text = libraries[indexPath.row].formal
        cell.libraryAddressLabel.text = libraries[indexPath.row].address
        cell.libraryTelLabel.text = libraries[indexPath.row].tel
        return cell
    }
}
