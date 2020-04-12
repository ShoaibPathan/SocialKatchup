//
//  MyPostsListView.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 04.04.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI
import Combine

class MyPostsListViewModel: ObservableObject {
    
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

struct MyPostsListView: View {
    
    // - Private Properties
    @State private var rightPadding: CGFloat = 800.0
    private var viewModel = MyPostsListViewModel(feedStorageProvider: FeedStorageProvider())
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().backgroundColor = .clear
    }
    
    // - Body
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.usersFeed, id: \.id) { model in
                    FeedPostCell(viewModel: FeedPostCellModel(postModel: model)).buttonStyle(PlainButtonStyle())
                }
                    
                .listRowInsets(.init())
            }
        }
    }
}

#if DEBUG
struct MyPostsListView_Previews: PreviewProvider {
    
    static var previews: some View {
        MyPostsListView()
    }
}
#endif
