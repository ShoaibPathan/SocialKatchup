//
//  LoginBackgroundComponent.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 06.02.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

struct LoginBackgroundComponent: View {
    var body: some View {
        VStack {
            
            ZStack {
                VStack(alignment: .center) {
                    Image("blob_top")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.top)
                        .frame(minWidth: 0.0, maxWidth: .infinity, minHeight: 211.0, maxHeight: 211.0)
                }
                .padding(.top, -45)
                
                VStack(alignment: .center, spacing: 24.0) {
                    Image("app_logo")
                        .frame(width: 92.0, height: 92.0)
                    
                    Text("Hello again!")
                        .multilineTextAlignment(.center)
                        .font(.custom(CustomFont.montserratMedium.rawValue, size: 18.0))
                        .foregroundColor(.textPrimary)
                }
                .padding(.top, 90)

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

struct LoginBackground_Previews: PreviewProvider {
    static var previews: some View {
        LoginBackgroundComponent()
    }
}
