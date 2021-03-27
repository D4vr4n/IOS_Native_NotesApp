//
//  Extension.swift
//  NotesApp
//
//  Created by Davran Arifzhanov on 28.03.2021.
//

import Foundation
import UIKit


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].folders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].folders[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotesFolderTableViewCell.identifier, for: indexPath) as? NotesFolderTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(identifier: "FolderDetailViewController") as! FolderDetailViewController
        destination.navBarTitle = models[indexPath.section].folders[indexPath.row].title
        self.navigationController?.pushViewController(destination, animated: true)
        let model = models[indexPath.section].folders[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        model.handler()
    }
}
