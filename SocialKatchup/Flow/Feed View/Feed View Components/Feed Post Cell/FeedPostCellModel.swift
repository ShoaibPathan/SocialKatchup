//
//  FeedPostCellModel.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 09.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI
import Combine

class FeedPostCellModel: ObservableObject {

    // - Internal Properties
    var postModel: FeedPostModel
    
    // - Published
    @Published var isLiked: Bool
    
    // - Init
    init(postModel: FeedPostModel) {
        self.postModel = postModel
        self.isLiked = postModel.isLiked
    }
}
