//
//  UserService.swift
//  InstagramFirestoreTutorial
//
//  Created by Junho Lee on 2022/03/09.
//

import Firebase
import UIKit

struct UserService {
    static func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
    
    static func fetchUsers(competion: @escaping([User]) -> Void) {
        COLLECTION_USERS.getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else { return }
           
            let users = snapshot.documents.map({ User(dictionary: $0.data()) })
            competion(users)
        }
    }
}
