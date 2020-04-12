//
//  FeedView.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 09.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    
    // - Internal Propeties
    var viewModel: FeedViewModel
    
    // - Init
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().backgroundColor = .clear
    }

    // - Body
    var body: some View {

            VStack {
                FeedViewHeader()
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
struct FeedView_Previews: PreviewProvider {
    
    static let viewModel = FeedViewModel(feedStorageProvider: FeedStorageProvider())
    
    static var previews: some View {
        FeedView(viewModel: viewModel)
    }
}
#endif
