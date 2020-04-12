//
//  FeedViewHeader.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 17.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI
import Combine

struct FeedViewHeader: View {
    
    // - Internal Properties
    @State var selectedModel: FeedCategoryModel = .allPosts
    
    // - Private Properties
    @State private var modalPresent = false
    @State private var isSearchActive = false

    @State private var searchText: String = ""

    // - Body
    var body: some View {
        
        HStack(alignment: .top, spacing: 8.0) {
        
            Button(action: {
                withAnimation {
                    self.isSearchActive = !self.isSearchActive
                }
            }) {
                Image("search")
                    .foregroundColor(.textPrimary)
            }
            Spacer()
            Group {
                if self.isSearchActive {
                    HStack() {
                        TextField("Search", text: self.$searchText)
                            .font(.custom(CustomFont.montserratRegular.rawValue, size: 15.0))
                            .foregroundColor(.textPrimary)
                            .textFieldStyle(BottomLineTextFieldStyle())
                        
                        if !searchText.isEmpty {
                            withAnimation {
                                Button(action: {
                                    self.searchText = ""
                                }) {
                                    Text("Cancel")
                                        .font(.custom(CustomFont.montserratRegular.rawValue, size: 15.0))
                                        .foregroundColor(.textPrimary)
                                }
                            }
                        }
                    }
                } else {
                    VStack() {
                        HStack() {
                            Text(selectedModel.title)
                                .font(.custom(CustomFont.montserratSemiBold.rawValue, size: 18.0))
                                .foregroundColor(.textPrimary)
                            Button(action: {
                                self.modalPresent.toggle()
                            }) {
                                Image("ic_rectangle")
                                    .foregroundColor(.textPrimary)
                            }
                            .sheet(isPresented: $modalPresent) {
                                CategoryListView(
                                    onDismiss: { selectedModel in
                                        self.selectedModel = selectedModel
                                        self.modalPresent = false
                                    },
                                    viewModel: CategoryListViewModel(selectedModel: self.selectedModel)
                                )
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Text("Chicago, IL 60611, USA")
                                .font(.custom(CustomFont.montserratRegular.rawValue, size: 14.0))
                                .foregroundColor(.textAdditional)
                            Spacer()
                        }
                    }
                }
            }
        }
        .padding(.all, 20.0)
        
    }
}

struct FeedViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        FeedViewHeader()
    }
}
