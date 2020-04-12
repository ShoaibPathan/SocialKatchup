//
//  RootView.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 16.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject private var viewModel: LoginViewModel
    @EnvironmentObject private var registerViewModel: RegisterViewModel
    
    var body: some View {
        Group {
            if viewModel.isLogged || registerViewModel.isUserRegistered {
                HomeView()
            } else {
                LoginView(viewModel: viewModel, registerViewModel: registerViewModel)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
