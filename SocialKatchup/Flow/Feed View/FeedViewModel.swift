//
//  FeedViewModel.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 09.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import Combine
import SwiftUI

class FeedViewModel: ObservableObject {
    
    // - Internal Properties
    @Published internal var usersFeed: [FeedPostModel]
    
    // - Private Properties
    private let feedStorageProvider: FeedStorageProviderProtocol
    
    // - Inits
    init(feedStorageProvider: FeedStorageProviderProtocol) {
        self.feedStorageProvider = feedStorageProvider
        self.usersFeed = feedStorageProvider.postList
    }
}
