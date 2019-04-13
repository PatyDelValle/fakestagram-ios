//
//  Author.swift
//  fakestagram
//
//  Created by LuisE on 3/16/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit
//@IBDesignable permite visualizar en el StoryBoard sin compilar ni accesar a la vista

@IBDesignable
class PostAuthorView: UIView {
    /*var author = Author?.self {
        didSet {updateView()}
    }
 */
    var author: Author!
    let avatarView: SVGView = SVGView()
    let nameLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        nameLabel.backgroundColor = .cyan
        addSubview(nameLabel)
        
        avatarView.clipsToBounds = true
        avatarView.layer.cornerRadius = 26
        avatarView.backgroundColor = .green
        addSubview(avatarView)
        
        setupAutoLayout()
    }

    func setupAutoLayout () {
        avatarView .translatesAutoresizingMaskIntoConstraints = false
        //Lista de constrains que se activan a traves del metodo activate
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            avatarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            avatarView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            avatarView.widthAnchor.constraint(equalToConstant: 52)
            ])
 
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Paty Del Valle" //author.name
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 32)
            ])
    }
    private func updateView(){
        guard let author = self.author else {return}
        nameLabel.text = author.name
        //avatarView.loadContent(for: author.avatarURL())
    }
}
