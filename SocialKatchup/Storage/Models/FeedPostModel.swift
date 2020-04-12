//
//  FeedPostModel.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 16.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

// MARK: - FeedPostModel
struct FeedPostModel: Decodable {
    
    var id: Int
    var price: Int
    var author: UserModel
    private var postTime: Int
    var message: String
    var isLiked: Bool
    
    var postTimeString: String {
        return self.postTime.getReadableDate() ?? ""
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case price
        case author
        case postTime
        case message
        case isLiked
    }
}

// MARK: - FeedPostModel: Hashable
extension FeedPostModel: Hashable {
    static func == (lhs: FeedPostModel, rhs: FeedPostModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
