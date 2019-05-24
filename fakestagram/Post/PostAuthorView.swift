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
    /*
    var author: Author? {
        didSet { updateView() }
    }
    private let avatarView: SVGView = {
        let svg = SVGView()
        svg.translatesAutoresizingMaskIntoConstraints = false
        return svg
    }()
    private let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Lorem Ipsum"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        self.backgroundColor = .clear
        addSubview(avatarView)
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            avatarView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 52),
            avatarView.heightAnchor.constraint(equalToConstant: 52)
            ])
        avatarView.clipsToBounds = true
        avatarView.layer.cornerRadius = 26
        
        addSubview(nameLbl)
        NSLayoutConstraint.activate([
            nameLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLbl.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 15),
            nameLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            nameLbl.heightAnchor.constraint(equalToConstant: 32)
            ])
    }
    
    private func updateView() {
        guard let author = self.author else { return }
        nameLbl.text = author.name
        avatarView.loadContent(from: author.avatarURL())
    }

    */

    var author: Author? {
        didSet { updateView() }
    }
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
        //nameLabel.backgroundColor = .cyan
        self.backgroundColor = .clear
        addSubview(nameLabel)
        
        avatarView.clipsToBounds = true
        avatarView.layer.cornerRadius = 26
        avatarView.backgroundColor = .cyan
        addSubview(avatarView)
        
        setupAutoLayout()
    }

    func setupAutoLayout () {
        avatarView .translatesAutoresizingMaskIntoConstraints = false
        //Lista de constrains que se activan a traves del metodo activate
        self.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            avatarView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 52),
            avatarView.heightAnchor.constraint(equalToConstant: 52)
            ])
        avatarView.clipsToBounds = true
        avatarView.layer.cornerRadius = 26

        
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
        guard let author = self.author else { return }
        nameLabel.text = author.name
        avatarView.loadContent(from: author.avatarURL())
    }
}
