//
//  SigninBViewController.swift
//  MyCaloriAPP
//
//  Created by User on 23/01/23.
//

import UIKit

class SigninBViewController: UIViewController {

    weak var presenter: SigninBPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SigninBViewController: SigninBView {
    
}
