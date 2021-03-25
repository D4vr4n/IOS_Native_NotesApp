//
//  FolderDetailViewController.swift
//  NotesApp
//
//  Created by Davran Arifzhanov on 25.03.2021.
//

import UIKit

class FolderDetailViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.layer.borderWidth = 10
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.searchTextField.layer.cornerRadius = 20
        searchBar.searchTextField.layer.masksToBounds = true
    }

}
