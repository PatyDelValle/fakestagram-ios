//
//  AccountClient.swift
//  fakestagram
//
//  Created by patricia  D3 on 4/13/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class AccountClient : RestClient<Account> {
    convenience init () {
        self.init(client: Client(), path : "/api/accounts")
    }
}
