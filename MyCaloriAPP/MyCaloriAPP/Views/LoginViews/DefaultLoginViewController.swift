//
//  DefaultLoginViewController.swift
//  MyCaloriAPP
//
//  Created by User on 23/01/23.
//

import UIKit

class DefaultLoginViewController: UIViewController {
    
    weak var presenter: DefaultLoginPresenter?
    
    //let touchID = true
    let rememberMe = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func loginAction(_ sender: Any) {
        if rememberMe {
            self.presenter?.gotoLoginPassword()
        } else {
            self.presenter?.gotoLoginA()
        }
    }
    

    @IBAction func signinAction(_ sender: Any) {
        self.presenter?.gotoSigninA()
    }
    
}

extension DefaultLoginViewController: DefaultLoginView {
    
}
