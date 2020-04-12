//
//  CategoryCell.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 22.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI
import Combine

struct CategoryCell: View {
    
    // - Internal Properties
    @State var isSelected: Bool
    var onDismiss: (FeedCategoryModel) -> Void
    
    var model: FeedCategoryModel

    // - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {

            Rectangle()
                .frame(height: 1.0, alignment: .bottom)
                .foregroundColor(Color.primary.opacity(0.1))
            
            Button(action: {
                self.onDismiss(self.model)
            }) {
               Text(model.title)
                .font(.custom(isSelected ? CustomFont.montserratBold.rawValue : CustomFont.montserratRegular.rawValue , size: 14.0))
                .foregroundColor(isSelected ? .textPrimary : .textAdditional)
                .padding(.all, 8)
            }
            

        }
        .padding(EdgeInsets(top: 0.0, leading: 8.0, bottom: 8.0, trailing: 8.0))

    }
}

struct CategoryCell_Previews: PreviewProvider {
    @State static var mockedSelected: FeedCategoryModel = .allPosts
    @State static var mocked = false

    static var previews: some View {
        CategoryCell(isSelected: true, onDismiss: { _ in
            
        }, model: .allPosts)
    }
}
