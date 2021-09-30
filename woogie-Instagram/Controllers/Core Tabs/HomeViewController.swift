//
//  ViewController.swift
//  woogie-Instagram
//
//  Created by 임재욱 on 2021/09/28.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Check Auth Status
        handleNotAuthenticated()
    }

}

extension HomeViewController{
    private func handleNotAuthenticated(){
        if Auth.auth().currentUser == nil{
            // Show Login
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
}

