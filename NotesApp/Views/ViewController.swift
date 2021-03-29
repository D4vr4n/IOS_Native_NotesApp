//
//  ViewController.swift
//  NotesApp
//
//  Created by Davran Arifzhanov on 25.03.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController{
    var models = [Section]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        searchBar.layer.borderWidth = 10
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.layer.masksToBounds = true
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.tableFooterView = UIView() // Remove the empty separator lines
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = CGFloat(50)
        
        self.tableView.register(NotesFolderTableViewCell.self, forCellReuseIdentifier: NotesFolderTableViewCell.identifier)
        
        self.view.addSubview(self.tableView)
        
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    //    MARK --Adding folders to ouer list
    func configure(){
        models.append(Section(title: "General", folders: [
            FolderModel(title: "Заметки", icon: UIImage(systemName: "folder")!, iconBackgroundColor: .white, notes: [Notes(noteTitle: "Title1", noteDesc: "desc1")]){
                print("First Cell Tapped!")
            },
            FolderModel(title: "Удаленные", icon: UIImage(systemName: "trash")!, iconBackgroundColor: .white, notes: [Notes(noteTitle: "Title2", noteDesc: "desc2")]){
                
            },
        ]))
        
        
    }
    
    
    //    MARK --Handliong add folder button tap
    @IBAction func addFolderTapped(_ sender: Any) {
        let alertVC = UIAlertController(title: "Новая папка", message: "Введите название для этой папки.", preferredStyle: .alert)
        
        alertVC.addTextField {
            (textFieldName: UITextField!) in
            textFieldName.placeholder = "Название"
        }
        
        let cancelAction = UIAlertAction(title: "Отменить", style: .default, handler: nil)
        cancelAction.setValue(UIColor.systemYellow, forKey: "titleTextColor")
        alertVC.addAction(cancelAction)
        
        //MARK -- Handling Add Button Tap
        let addAction = UIAlertAction(title: "Сохранить", style: .default) { (UIAlertAction) -> Void in
            
            self.models.append(Section(title: "General", folders: [
                FolderModel(title: alertVC.textFields?[0].text ?? "", icon: UIImage(systemName: "folder")!, iconBackgroundColor: .white, notes: [Notes(noteTitle: "Title3", noteDesc: "desc3")]){
                    print("Third Cell Tapped!")
                }
            ]))
            
            self.tableView.reloadData()
            
        }
        
        addAction.isEnabled = false
        
        // adding the notification observer here
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object:alertVC.textFields?[0],
                                               queue: OperationQueue.main) { (notification) -> Void in
            
            let textFieldName = alertVC.textFields?[0] as! UITextField
            addAction.isEnabled = !textFieldName.text!.isEmpty
        }
        
        
        //MARK -- Presenting alertVC when addButtonTapped
        alertVC.addAction(addAction)
        present(alertVC, animated: true, completion: nil)
        
    }
    
    
    @IBAction func addNoteTapped(_ sender: Any) {
    }
}

