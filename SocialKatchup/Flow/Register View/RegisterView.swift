//
//  RegisterView.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 25.02.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject var viewModel: RegisterViewModel 
    @Binding var isActive: Bool
    
    var body: some View {
        
        ZStack {
            RegisterViewBackgroundComponent()
                .padding(.top, -90)
            RegisterViewFormComponent(backNavigationTrigger: $isActive, viewModel: self.viewModel)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
            Button(
                action: {
                    self.isActive = false
                },
                label: {
                    Image("left-arrow")
                        .foregroundColor(.white)
                }
            )
        )
        
    }
}

#if DEBUG
struct RegisterView_Previews: PreviewProvider {
    
    // - moked values
    @State static var mocked = false
    static var mockedViewModel = RegisterViewModel()
    
    static var previews: some View {
        // Uncomment NavigationView for checking view in navigation view state
        //        NavigationView {
        RegisterView(viewModel: mockedViewModel, isActive: $mocked)
        //        }
    }
}
#endif
