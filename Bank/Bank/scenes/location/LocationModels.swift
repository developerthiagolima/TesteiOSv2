//
//  LocationModels.swift
//  Bank
//
//  Created by Thiago Lima on 19/01/19.
//  Copyright (c) 2019 SantanderTecnologia. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

struct Location {
    
    struct Login {
        
        struct Request{
            var user: String?
            var password: String?
        }
        
        struct Response{
            var userAccount: UserAccount?
            var error: Error?
        }
        
    }
    
    struct UserAccount {
        var userId = 0
        var name: String
        var bankAccount: String
        var agency: String
        var balance: Float64
    }
    
    struct Error {
        var code: Int
        var message: String
    }
}