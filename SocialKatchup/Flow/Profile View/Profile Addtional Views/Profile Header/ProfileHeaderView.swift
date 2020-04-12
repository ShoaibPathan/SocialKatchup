//
//  ProfileHeaderView.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 04.04.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @ObservedObject var viewModel: ProfileHeaderViewModel
    
    var body: some View {
        VStack(spacing: 16.0) {
            VStack(alignment: .center, spacing: 16.0) {
                
                Image(viewModel.currentUser?.avatar ?? "")
                    .clipShape(Circle())
                    .frame(width: 140.0, height: 140.0)
                
                VStack(spacing: 8.0) {
                    Text(self.viewModel.currentUser?.fullName ?? "")
                        .font(Font.custom(CustomFont.montserratSemiBold.rawValue, size: 16.0))
                        .foregroundColor(.textPrimary)
                    Text("New Orlean".localized)
                        .font(Font.custom(CustomFont.montserratRegular.rawValue, size: 13.0))
                        .foregroundColor(.textAdditional)
                }
                .frame(maxWidth: .infinity)
            }
 
            HStack(alignment: .center, spacing: 18.0) {
                VStack(spacing: 6.0) {
                    Text("\(viewModel.currentUser?.detail_info.posts_count ?? 0)")
                        .font(Font.custom(CustomFont.montserratRegular.rawValue, size: 16.0))
                        .foregroundColor(.textPrimary)
                    Text("Posts".localized)
                        .font(Font.custom(CustomFont.montserratMedium.rawValue, size: 11.0))
                        .foregroundColor(.textAdditional)
                }
                .frame(maxWidth: .infinity)
                
                VStack(spacing: 6.0) {
                    Text("\(viewModel.currentUser?.detail_info.followers_count ?? 0)")
                        .font(Font.custom(CustomFont.montserratRegular.rawValue, size: 16.0))
                        .foregroundColor(.textPrimary)
                    
                    Text("Followers".localized)
                        .font(Font.custom(CustomFont.montserratMedium.rawValue, size: 11.0))
                        .foregroundColor(.textAdditional)
                }
                .frame(maxWidth: .infinity)
                
                VStack(spacing: 6.0) {
                    Text("\(viewModel.currentUser?.detail_info.following_count ?? 0)")
                        .font(Font.custom(CustomFont.montserratRegular.rawValue, size: 16.0))
                        .foregroundColor(.textPrimary)
                    Text("Following".localized)
                        .font(Font.custom(CustomFont.montserratMedium.rawValue, size: 11.0))
                        .foregroundColor(.textAdditional)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: 40.0)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(viewModel: ProfileHeaderViewModel())
    }
}
