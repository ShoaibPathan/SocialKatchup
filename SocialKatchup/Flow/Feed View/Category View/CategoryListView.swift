//
//  CategoryListView.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 22.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

struct CategoryListView: View {
    
    // - Internal Properties
    var onDismiss: (FeedCategoryModel) -> Void
    
    @ObservedObject var viewModel: CategoryListViewModel
    
    init(onDismiss: @escaping (FeedCategoryModel) -> Void , viewModel: CategoryListViewModel) {
        self.onDismiss = onDismiss
        self.viewModel = viewModel
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().backgroundColor = .clear
    }
    
    
    var body: some View {
        
        VStack {
            Text("Choose the categories you are interested in")
                .font(.custom(CustomFont.montserratBold.rawValue, size: 24.0))
                .foregroundColor(.textPrimary)
                .padding(EdgeInsets(top: 8.0, leading: 8.0, bottom: 0.0, trailing: 8.0))
            
            List() {
                ForEach(self.viewModel.categoryDatasource, id: \.title) { model in
                    CategoryCell(
                        isSelected: self.viewModel.selectedModel == model,
                        onDismiss: { selectedModel in
                            self.onDismiss(selectedModel)
                        },
                        model: model
                    )
                }
                .lineSpacing(0.0)
                .listRowInsets(.init())
            }
        }
        
    }
}
