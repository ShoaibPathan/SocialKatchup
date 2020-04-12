//
//  LikedPostCell.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 04.04.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

struct LikedPostCell: View {
    
    let model: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            
            HStack(alignment: .top, spacing: 24.0) {
                HStack(alignment: .top, spacing: 15.0) {
                    Image("liked_post")
                        .frame(width: 48.0, height: 48.0)
                        .clipShape(Circle())
                    
                    Group {
                        Text("Dany Gratorus")
                            .font(Font.custom(CustomFont.montserratBold.rawValue, size: 14.0))
                            .foregroundColor(.textPrimary) +
                            Text(" and")
                                .font(Font.custom(CustomFont.montserratRegular.rawValue, size: 14.0))
                                .foregroundColor(.textPrimary) +
                            Text(" 14 others")
                                .font(Font.custom(CustomFont.montserratBold.rawValue, size: 14.0))
                                .foregroundColor(.textPrimary) +
                            Text(" liked your post")
                                .font(Font.custom(CustomFont.montserratRegular.rawValue, size: 14.0))
                                .foregroundColor(.textPrimary)
                    }
                    
                }
                
                Spacer()
                
                HStack(alignment: .center) {
                    Text("03:22 PM")
                        .font(Font.custom(CustomFont.montserratSemiBold.rawValue, size: 11.0))
                        .foregroundColor(.textAdditional)
                }
            }
            
        }
        .padding(.all, 12.0)
    }
}

struct LikedPostCell_Previews: PreviewProvider {
    static var previews: some View {
        LikedPostCell()
    }
}
