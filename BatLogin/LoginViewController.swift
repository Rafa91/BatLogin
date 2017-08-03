//
//  LoginViewController.swift
//  BatLogin
//
//  Created by Rafael Navarro on 4/1/17.
//  Copyright © 2017 Rafael Navarro. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imgLogoBatman: UIImageView!
    @IBOutlet weak var imgBatLogin: UIImageView!
    
    @IBOutlet weak var lblUsuario: UILabel!
    @IBOutlet weak var lblPass: UILabel!
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    @IBOutlet weak var btnEntrar: UIButton!
    
    var headerAnimator : UIViewPropertyAnimator!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgLogoBatman.transform = CGAffineTransform(translationX: 0.0, y: -120)
        imgBatLogin.transform = CGAffineTransform(translationX: 0.0, y: -170)
        lblUsuario.transform = CGAffineTransform(translationX: -200, y: 0.0)
        lblPass.transform = CGAffineTransform(translationX: -200.0, y: 0.0)
        txtUsuario.transform = CGAffineTransform(translationX: 350.0, y: 0.0)
        txtPass.transform = CGAffineTransform(translationX: 350.0, y: 0.0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureViews()
        buildsAnimations()
    }
    
    func configureViews() {
        txtUsuario.layer.cornerRadius = 3
        txtPass.layer.cornerRadius = 3
        btnEntrar.layer.cornerRadius = 3
    }

    func buildsAnimations(){
        headerAnimator = UIViewPropertyAnimator (duration: 0.6, curve: .easeInOut, animations: nil)
        headerAnimator.addAnimations {
            self.imgLogoBatman.transform = CGAffineTransform.identity
            self.imgBatLogin.transform = CGAffineTransform.identity
            self.lblUsuario.transform = CGAffineTransform.identity
            self.lblPass.transform = CGAffineTransform.identity
            self.txtUsuario.transform = CGAffineTransform.identity
            self.txtPass.transform = CGAffineTransform.identity
        }
        headerAnimator.startAnimation()
    }
}
