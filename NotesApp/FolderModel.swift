//
//  FolderModel.swift
//  NotesApp
//
//  Created by Davran Arifzhanov on 25.03.2021.
//

import Foundation
import UIKit


struct Section {
    let title: String
    let folders: [FolderModel]
}

struct FolderModel {
    let title: String
    let icon: UIImage
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}
