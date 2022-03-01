//
//  AuthService.swift
//  InstagramFirestoreTutorial
//
//  Created by Junho Lee on 2022/03/01.
//

import Foundation
import UIKit

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static func registerUser(withCredential credentials: AuthCredentials) {
        print("DEBUG: Crednetials are \(credentials)")
    }
}
