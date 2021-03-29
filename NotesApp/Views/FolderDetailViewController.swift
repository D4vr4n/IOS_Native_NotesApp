//
//  FolderDetailViewController.swift
//  NotesApp
//
//  Created by Davran Arifzhanov on 25.03.2021.
//

import UIKit

class FolderDetailViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    var navBarTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.layer.borderWidth = 10
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.layer.masksToBounds = true
        self.title = self.navBarTitle
    }

}
