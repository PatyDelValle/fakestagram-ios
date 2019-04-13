//
//  Post.swift
//  fakestagram
//
//  Created by LuisE on 3/16/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation
import UIKit

struct Post: Codable {
    let id: Int
    let title: String
    let imageURL: String?
    let author: Author?
    let likesCount: Int
    let commentsCount: Int
    let createdAt: String
    
    //Funcion para cargar los datos
    func load(_ image: @escaping (UIImage) -> Void){
        guard let urlString = imageURL, let url = URL(string: urlString) else {return}
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url), let img = UIImage(data: data) {DispatchQueue.main.async {
                image(img)}
            }
            
        }
    }
}

