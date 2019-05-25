//
//  PostCollectionViewCell.swift
//  fakestagram

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "postViewCell"
    public var post: Post? {
        didSet { updateView() }
    }
    
    //@IBOutlet weak var imageViev: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorView: PostAuthorView!
    @IBOutlet weak var titleLbl: UITextView!
    @IBOutlet weak var likesCountLbl: UILabel!
    @IBOutlet weak var commentsCountLbl: UILabel!
    
    //awakeFromNib recargar la vista actualizada
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    //llenado de la celda
    private func updateView() {
        guard let post = self.post else { return  }
        post.load { [weak self] img in
            self?.imageView.image = img
        }
        authorView.author = post.author
        titleLbl.text = post.title
        likesCountLbl.text = "\(post.likesCount) likes"
        commentsCountLbl.text = "\(post.commentsCount) comments"
    }
}
