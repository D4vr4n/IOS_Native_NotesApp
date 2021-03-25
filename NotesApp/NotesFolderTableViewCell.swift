//
//  NotesFolderTableViewCell.swift
//  NotesApp
//
//  Created by Davran Arifzhanov on 25.03.2021.
//

import UIKit

class NotesFolderTableViewCell: UITableViewCell {
    static let identifier = "NotesFolderTableViewCell"
    
    private let iconConatiner: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconConatiner)
        iconConatiner.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = contentView.frame.size.height - 12
        iconConatiner.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size - imageSize)/2, y: (size - imageSize)/2, width: imageSize, height: imageSize)
        
        label.frame = CGRect(
            x: 25 + iconConatiner.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 20 - iconConatiner.frame.size.width,
            height: contentView.frame.size.height
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconConatiner.backgroundColor = nil
    }
    
    public func configure(with model: FolderModel){
        label.text = model.title
        iconImageView.image = model.icon
        iconConatiner.backgroundColor = model.iconBackgroundColor
    }
    
}
