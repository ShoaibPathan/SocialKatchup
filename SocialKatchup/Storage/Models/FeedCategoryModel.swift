//
//  FeedCategoryModel.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 22.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

enum FeedCategoryModel: Hashable, CaseIterable {
    
    case allPosts
    case events
    case friendsPost
    
    var title: String {
        switch self {
        case .allPosts:
            return "All Photos".localized
            
        case .events:
            return "Events".localized
            
        case .friendsPost:
            return "My Friends Posts".localized
        }
    }
    
}
