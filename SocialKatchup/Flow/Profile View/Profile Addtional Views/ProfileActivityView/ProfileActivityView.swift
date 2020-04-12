//
//  ProfileActivityView.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 04.04.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

struct ProfileActivityView: View {
    
    // - Private properties
    private let sectionButtonPadding: CGFloat = 38.0
    private let sectionButtonSpace: CGFloat = 20.0
    @State private var selectedIndex: Int = 0
    
    // - Body
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    HStack(spacing: self.sectionButtonSpace) {
                        VStack(spacing: 8.0) {
                            Button(action: {
                                withAnimation(.interactiveSpring()) {
                                    self.selectedIndex = 0
                                }
                            }) {
                                Text("Posts")
                                    .font(Font.custom(CustomFont.montserratMedium.rawValue, size: 14.0))
                                    .foregroundColor(self.selectedIndex == 0 ? .textPrimary : .textAdditional)
                            }
                            .frame(height: 24.0)
                            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 24.0)
                        }
                        
                        
                        VStack(spacing: 8.0) {
                            Button(action: {
                                withAnimation(.interactiveSpring()) {
                                    self.selectedIndex = 1
                                }
                            }) {
                                Text("Liked")
                                    .font(Font.custom(CustomFont.montserratMedium.rawValue, size: 14.0))
                                    .foregroundColor(self.selectedIndex == 1 ? .textPrimary : .textAdditional)
                            }
                            .frame(height: 24.0)
                            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 24.0)
                        }
                    }
                    .padding([.leading, .trailing], self.sectionButtonPadding)
  

                    Rectangle()
                        .frame(height: 3.0)
                        .foregroundColor(Color.redActive)
                        .cornerRadius(radius: 10.0, corners: [.topRight, .topLeft])
                        .padding(.leading, self.selectedIndex == 0 ? self.sectionButtonPadding : (geometry.size.width / 2.0) + self.sectionButtonSpace)
                        .padding(.trailing, self.selectedIndex == 1 ?  self.sectionButtonPadding : (geometry.size.width / 2.0) + self.sectionButtonSpace)
                }
                            Group {
                                if self.selectedIndex == 0 {
                                    MyPostsListView()
                                } else {
                                    LikedPostsView()
                                }
                            }
            }
        }
    }
}

struct ProfileActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActivityView()
    }
}
