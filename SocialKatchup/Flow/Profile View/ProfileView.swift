//
//  ProfileView.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 04.04.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    // - Private Propeties
    @Environment(\.localStatusBarStyle) private var statusBarStyle
    
    var body: some View {
        VStack(spacing: 16.0) {
            ProfileHeaderView(viewModel: ProfileHeaderViewModel())
            ProfileActivityView()
        }
        .onAppear {
            self.statusBarStyle.currentStyle = .darkContent
        }
        .padding(.top, 16.0)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
