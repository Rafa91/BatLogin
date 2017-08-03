//
//  ViewController.swift
//  BatLogin
//
//  Created by Rafael Navarro on 8/11/16.
//  Copyright © 2016 Rafael Navarro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLogoBatman: UIImageView!
    
    @IBOutlet weak var lblInstruction: UILabel!
    
    var viewanimator : UIViewPropertyAnimator!
    private let  unlockGesture = UIPanGestureRecognizer()
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        unlockGesture.addTarget(self, action: #selector(handle(pan:)))
        self.view.addGestureRecognizer(unlockGesture)
        
        viewanimator = UIViewPropertyAnimator(duration: 1.0,
                                              curve: .easeInOut,
                                              animations: nil)
        
        viewanimator.addAnimations {
            self.lblInstruction.layer.opacity = 0
            self.imgLogoBatman.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
        
        
    }

    func handle(pan: UIPanGestureRecognizer) {
        
        let speed : CGFloat = 2.0
        
        switch pan.state {
        case .began:
            viewanimator.pauseAnimation()
        case .changed:
            let translation = pan.translation(in: pan.view).y / speed
            viewanimator.fractionComplete = translation / 100
            if viewanimator.fractionComplete >= 0.99{
                buildAnimation()
            }
        default:
            break
        }
        
    }
    
    func buildAnimation() {
        let logoAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn) { 
            self.lblInstruction.transform = CGAffineTransform(scaleX: 25.0, y: 25.0)
        }
        logoAnimator.startAnimation()
        logoAnimator.addCompletion { (UIViewAnimatingPosition) in
            self.beginApp()
        }
    }
    
    func beginApp() {
        
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        self.present(loginViewController!, animated: true, completion: nil)
        
    }

}

