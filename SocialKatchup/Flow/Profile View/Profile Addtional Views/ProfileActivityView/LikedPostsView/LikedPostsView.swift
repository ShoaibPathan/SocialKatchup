//
//  LikedPostsView.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 04.04.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

// MARK: - LikedPostModel
struct LikedPostModel: Hashable, Codable {
    var id: Int
    
    init() {
        self.id = Int.random(in: 1..<100)
    }
}

// MARK: - LikedPostsView
struct LikedPostsView: View {
    
    // - Private Properties
    private var likedPost: [LikedPostModel]
    
    // - Init
    init() {
        self.likedPost = [LikedPostModel(), LikedPostModel(), LikedPostModel(), LikedPostModel(), LikedPostModel(), LikedPostModel(), LikedPostModel(), LikedPostModel()]
        UITableView.appearance().separatorStyle = .none
               UITableView.appearance().showsVerticalScrollIndicator = false
               UITableView.appearance().backgroundColor = .clear
    }
    
    // - Body
    var body: some View {
        VStack {
            List {
                ForEach(likedPost, id: \.id) { model in
                    LikedPostCell()
                }
                .listRowInsets(.init())
            }
        }
        
    }
}

struct LikedPostsView_Previews: PreviewProvider {
    static var previews: some View {
        LikedPostsView()
    }
}
