//
//  HomeView.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 17.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

// TODO: - Add DI
struct HomeView: View {
    
    private var viewModel = HomeViewModel()
    
    // - Internal Properties
    @State var selectedItem = 0
    @Environment(\.localStatusBarStyle) var statusBarStyle
    
    // - Private Propeties
    @State private var opacity: Double = 0.0
    @State private var topPadding: CGFloat = 1000.0
    private var feedViewModel = FeedViewModel(feedStorageProvider: FeedStorageProvider())
    
    // - Body
    var body: some View {
        TabView(selection: $selectedItem) {
            
            FeedView(viewModel: feedViewModel)
                .tabItem({
                    if selectedItem == 0 {
                        Image("home_selected")
                    } else {
                        Image("home_normal")
                    }
                })
                .tag(0)
            
            ProfileView()
                .tabItem({
                    if selectedItem == 1 {
                        Image("userProfile_selected")
                    } else {
                        Image("userProfile_normal")
                    }
                    
                    
                })
                .tag(1)
        }
        .opacity(opacity)
        .foregroundColor(.white)
        .onAppear {
            self.statusBarStyle.currentStyle = .darkContent
            
            let baseAnimation = Animation.easeInOut(duration: 1.3)
            let repeated = baseAnimation.repeatCount(1)

            return withAnimation(repeated) {
                self.topPadding = 0.0
                self.opacity = 1.0
            }
        }
        .padding(.top, self.topPadding)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
