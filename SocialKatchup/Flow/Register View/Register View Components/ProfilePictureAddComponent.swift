//
//  ProfilePictureAddComponent.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 09.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI
import Combine

struct ProfilePictureAddComponent: View {
    
    @State var showImagePicker: Bool = false
    @Binding var image: UIImage?
    
    var body: some View {
        ZStack {
            Image(uiImage: image ?? UIImage(named: "ic_default_profile")!)
                .resizable()
                .frame(width: 120.0, height: 120.0)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white10, lineWidth: 4.0))
                    
            
            VStack(alignment: .leading) {
                AddRoundedButton(buttonAction: {
                    withAnimation {
                        self.showImagePicker.toggle()
                    }
                    })
                    .frame(width: 30.0, height: 30.0)
            }
            .padding(.top, 70.0)
            .padding(.leading, 70.0)
            
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image)
        }
    }
}

#if DEBUG
struct ProfilePictureAddComponent_Previews: PreviewProvider {
    @State static var image: UIImage?
    static var previews: some View {
        ProfilePictureAddComponent(image: $image)
    }
}
#endif

