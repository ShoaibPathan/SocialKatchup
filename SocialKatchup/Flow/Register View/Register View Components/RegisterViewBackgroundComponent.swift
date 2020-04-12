//
//  RegisterViewBackgroundComponent.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 25.02.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

struct RegisterViewBackgroundComponent: View {
       var body: some View {
        VStack {
            
            ZStack {
                VStack(alignment: .center) {
                    Image("blob_top")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.top)
                        .frame(minWidth: 0.0, maxWidth: .infinity, minHeight: 202.0, maxHeight: 202.0)
                }
                .padding(.top, -45.0)
                
                VStack(alignment: .center, spacing: 24.0) {
                    Text("Hello! \n Sign up to get started.")
                        .multilineTextAlignment(.center)
                        .font(.custom(CustomFont.montserratMedium.rawValue, size: 18.0))
                        .foregroundColor(.white)
                }
                .padding(.top, -45.0)
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                Image("blob_bottom")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.bottom)
                    .frame(minWidth: 0.0, maxWidth: 239.0, minHeight: 70.0, maxHeight: 70.0)
                
            }
        }
    }
}

struct RegisterViewBackground_Previews: PreviewProvider {
    static var previews: some View {
        RegisterViewBackgroundComponent()
    }
}
