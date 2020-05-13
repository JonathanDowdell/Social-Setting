//
//  SceneDelegate.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/15/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    enum VC {
        case loginRegister
        case verified
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        defaults()
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabController()
        window?.backgroundColor = .tertiarySystemBackground
        window?.makeKeyAndVisible()
    }
    
    fileprivate func defaults() {
        let navAppearance = UINavigationBar.appearance()
        navAppearance.barTintColor = .tertiarySystemBackground
        navAppearance.shadowImage = UIImage()
        navAppearance.setBackgroundImage(UIImage(), for: .default)
        navAppearance.isTranslucent = false
        
        navAppearance.tintColor = DefaultStyles.Colors.SSBaseColor
    }
    
    func switchTo(vc: VC) {
        if vc == .loginRegister {
            window?.rootViewController = createLoginRegister()
        } else {
            window?.rootViewController = createTabController()
        }
    }
    
    func createLoginRegister() -> UINavigationController {
        let nav = UINavigationController(rootViewController: LoginVC())
        return nav
    }
    
    func createTabController() -> UITabBarController {
        let tabController = UITabBarController()
        tabController.tabBar.tintColor = DefaultStyles.Colors.SSBaseColor
        tabController.viewControllers = [
            createMainFeedVC(),
//            createFriendsVC(),
            createMessageVC(),
            createActivityVC(),
            createProfileVC()
        ]
        return tabController
    }
    
    private func createMainFeedVC() -> UINavigationController {
        let feedVC = FeedVC()
        feedVC.title = "Feed"
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "doc.plaintext")?.resizedImageWithinRect(rectSize: CGSize(width: 24, height: 24)), tag: 0)
        return UINavigationController(rootViewController: feedVC)
    }
    
    private func createFriendsVC() -> UINavigationController {
        let friendsVC = FriendsVC()
        friendsVC.title = "Friends"
        friendsVC.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.2.fill")?.resizedImageWithinRect(rectSize: CGSize(width: 24, height: 24)), tag: 0)
        return UINavigationController(rootViewController: friendsVC)
    }
    
    private func createMessageVC() -> UINavigationController {
        let feedVC = FeedVC()
        feedVC.title = "Chat"
        feedVC.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(systemName: "message.fill")?.resizedImageWithinRect(rectSize: CGSize(width: 24, height: 24)), tag: 0)
        return UINavigationController(rootViewController: feedVC)
    }

    private func createActivityVC() -> UINavigationController {
        let feedVC = FeedVC()
        feedVC.title = "Activity"
        feedVC.tabBarItem = UITabBarItem(title: "Activity", image: UIImage(systemName: "flame.fill")?.resizedImageWithinRect(rectSize: CGSize(width: 24, height: 24)), tag: 0)
        return UINavigationController(rootViewController: feedVC)
    }
    
    private func createProfileVC() -> UINavigationController {
        let profileVC = ProfileVC()
        profileVC.title = "Profile"
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle.fill")?.resizedImageWithinRect(rectSize: CGSize(width: 24, height: 24)), tag: 0)
        return UINavigationController(rootViewController: profileVC)
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

