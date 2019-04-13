//
//  Secrets.swift
//  fakestagram
//
//  Created by LuisE on 3/17/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

enum Secrets {
    case host
    case uuid
    
    var value: String? {
        switch self {
        case .host:
            return "https://fakestagram-api.herokuapp.com/"
        case .uuid:
            return UserDefaults.standard.string(forKey: "Paty...")
        }
    }
    func set(value: String ) -> Bool{
        switch self {
        case .uuid:
            UserDefaults.standard.set(value, forKey: "Paty...")
            return true
        default:
            return false
        }
    }
}
