//
//  ProfileViewController.swift
//  fakestagram
//
//  Created by Gabriel Castillo Hernándes on 5/24/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation
import UIKit
class ProfileViewController: UIViewController {
    
    @IBOutlet weak var authorView: PostAuthorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authorView.author = Author(name: "jojo")
    }
}

