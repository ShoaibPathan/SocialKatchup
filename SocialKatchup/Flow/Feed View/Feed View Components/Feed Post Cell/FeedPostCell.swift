//
//  FeedPostCell.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 09.03.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI
import Combine

struct FeedPostCell: View {
    
    var viewModel: FeedPostCellModel
    
    var body: some View {
        
        VStack {
            Rectangle()
            .frame(height: 1.0, alignment: .bottom)
            .foregroundColor(Color.primary.opacity(0.1))
            VStack(spacing: 20.0) {
                VStack(spacing: 10.0) {
                    HStack(spacing: 10.0) {
                        Image("ic_default_profile")
                            .resizable()
                            .frame(width: 36.0, height: 36.0)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(self.viewModel.postModel.author.fullName)
                                .font(.custom(CustomFont.montserratMedium.rawValue, size: 15.0))
                                .foregroundColor(.primary)
                            
                            Text(self.viewModel.postModel.postTimeString)
                                .font(.custom(CustomFont.montserratRegular.rawValue, size: 10.0))
                                .foregroundColor(.textAdditional)
                        }
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                                Image("ic_more")
                                }
                            )
                            .frame(width: 24.0, height: 24.0)
                            .foregroundColor(.primary)
                    }
                    
                    Text(self.viewModel.postModel.message)
                        .lineLimit(nil)
                        .font(.custom(CustomFont.montserratRegular.rawValue, size: 13.0))
                        .foregroundColor(.primary)
                        .padding(.all, 0.0)
                }
                
                HStack {
                    Button(action: {
                        self.viewModel.isLiked = !self.viewModel.isLiked
                    }, label: {
                        Image(viewModel.isLiked ? "ic_like_filled" : "ic_like")
                            .frame(width: 24.0, height: 24.0)
                            .foregroundColor(viewModel.isLiked ? .redActive : .primary)
                    })
                    
                    Image("ic_comment")
                        .frame(width: 24.0, height: 24.0)
                        .foregroundColor(.primary)
                    Spacer()
                    
                    Text( "$\(self.viewModel.postModel.price)")
                        .font(.custom(CustomFont.montserratMedium.rawValue, size: 15.0))
                        .foregroundColor(.primary)
                }
            }
            .padding(.all, 12.0)
            
            
        }
        .background(Color.white)
        .cornerRadius(8.0)
        .padding(.top, 8.0)
        .padding(.bottom, 8.0)
        .padding(.trailing, 8)
        .padding(.leading, 8)
        
    }
}

#if DEBUG
struct FeedPostCell_Previews: PreviewProvider {
    
    static let storage: FeedStorageProviderProtocol = FeedStorageProvider()
    static var mokedModel = FeedPostCellModel(postModel: storage.postList[0])
    
    static var previews: some View {
        FeedPostCell(viewModel: mokedModel)
    }
}
#endif
