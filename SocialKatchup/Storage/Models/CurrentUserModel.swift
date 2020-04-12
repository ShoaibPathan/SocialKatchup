//
//  CurrentUserModel.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 04.04.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import Foundation

struct CurrentUserModel: Decodable {
    var id: Int
    private var name: String
    private var surname: String
    var avatar: String
    var detail_info: UserDetailInfo
    
    var fullName: String {
        return name + " " + surname
        
    }
}

struct UserDetailInfo: Decodable {
    var posts_count: Int
    var followers_count: Int
    var following_count: Int
}
