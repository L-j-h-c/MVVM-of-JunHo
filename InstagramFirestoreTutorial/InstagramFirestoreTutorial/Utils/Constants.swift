//
//  Constants.swift
//  InstagramFirestoreTutorial
//
//  Created by Junho Lee on 2022/03/09.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
