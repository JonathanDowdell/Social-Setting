//
//  Splash.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 5/13/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class SplashView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
            sceneDelegate.verifyUser()
        }
    }
    
}
