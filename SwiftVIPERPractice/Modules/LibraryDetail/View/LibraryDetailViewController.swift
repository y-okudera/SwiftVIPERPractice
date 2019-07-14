//
//  LibraryDetailViewController.swift
//  SwiftVIPERPractice
//
//  Created by Yuki Okudera on 2019/07/14.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit

final class LibraryDetailViewController: UIViewController {
    
    var presenter: LibraryDetailViewPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LibraryDetailViewController: LibraryDetailView {
    
}
