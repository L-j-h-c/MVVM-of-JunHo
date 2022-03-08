//
//  MainTabController.swift
//  InstagramFirestoreTutorial
//
//  Created by Junho Lee on 2022/02/13.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    // MARK: - Lifecycle
    
    private var user: User? {
        didSet {
            guard let user = user else { return }
            configureViewControllers(withUser: user)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        fetchUser()
    }
    
    // MARK: = API
    
    func fetchUser() {
        UserService.fetchUser { user in
            self.user = user
            self.navigationItem.title = user.username
        }
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginController()
                controller.delegate = self
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Helpers
    
    func configureViewControllers(withUser user: User) {
        view.backgroundColor = .white
        
        // 뷰컨트롤러들의 인스턴스를 만든 것
        let layout = UICollectionViewFlowLayout()
        let feed = templateNavigationController(unselectedImage: UIImage(named: "home_unselected"), selectedImage: UIImage(named: "home_selected"), rootViewController: FeedController(collectionViewLayout: layout))
        
        let search = templateNavigationController(unselectedImage: UIImage(named: "search_unselected"), selectedImage: UIImage(named: "search_selected"), rootViewController: SearchController())
        
        let imageSelector = templateNavigationController(unselectedImage: UIImage(named: "plus_unselected"), selectedImage: UIImage(named: "plus_unselected"), rootViewController: ImageSelectorController())
        
        let notifications = templateNavigationController(unselectedImage: UIImage(named: "like_unselected"), selectedImage: UIImage(named: "like_selected"), rootViewController: NotificationController())
        
        let profileController = ProfileController(user: user)
        let profile = templateNavigationController(unselectedImage: UIImage(named: "profile_unselected"), selectedImage: UIImage(named: "profile_selected"), rootViewController: profileController)
        
        viewControllers = [feed, search, imageSelector, notifications, profile]
        
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()

            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
    
    func templateNavigationController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        nav.navigationBar.backgroundColor = .white
        return nav
    }
}

extension MainTabController: AuthenticationDelegate {
    func authenticationDidComplete() {
        fetchUser()
        self.dismiss(animated: true, completion: nil)
    }
}
