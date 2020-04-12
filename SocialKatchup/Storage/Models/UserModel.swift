//
//  UserModel.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 16.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import Foundation
import Combine

struct UserModel: Codable {
    
    // - Publicc Properties
    var id: Int
    var avatar: String?
    
    var fullName: String {
        return name + " " + surname
    }
    
    // - Private Properties
    private var name: String
    private var surname: String
    
    // - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case surname
        case avatar
    }
    
}
