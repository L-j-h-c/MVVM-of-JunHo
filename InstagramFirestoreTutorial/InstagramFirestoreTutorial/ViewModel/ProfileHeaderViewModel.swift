//
//  ProfileHeaderViewModel.swift
//  InstagramFirestoreTutorial
//
//  Created by Junho Lee on 2022/03/09.
//

import Foundation

struct ProfileHeaderViewModel {
    let user: User
    
    var fullname: String {
        return user.fullname
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    init(user: User) {
        self.user = user
    }
}
