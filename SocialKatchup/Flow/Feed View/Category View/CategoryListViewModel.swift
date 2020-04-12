//
//  CategoryListViewModel.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 22.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI
import Combine

class CategoryListViewModel: ObservableObject {
    
    @State var selectedModel: FeedCategoryModel
    
    @Published internal var categoryDatasource: [FeedCategoryModel]

    init(selectedModel: FeedCategoryModel) {
        self.selectedModel = selectedModel
        self.categoryDatasource = FeedCategoryModel.allCases
    }
}
