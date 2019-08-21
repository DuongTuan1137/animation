//
//  ViewController.swift
//  Animation3
//
//  Created by AnhDCT on 8/21/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ball: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ball.layer.cornerRadius = ball.frame.width/2
        UIView.animateKeyframes(withDuration: 2, delay: 0.0, options: .repeat, animations: {
            //add keyframes
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2, animations: {
                self.ball.center.x += self.view.frame.width/2 - 30
                self.ball.center.y += 60
            })
            
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.2) {
                self.ball.center.x += self.view.frame.width/2 - 30
                self.ball.center.y -= 60
               
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2) {
                self.ball.center.x -= self.view.frame.width/2 - 30
                self.ball.center.y += 60
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.2) {
                self.ball.center.x -= self.view.frame.width/2 - 30
                self.ball.center.y -= 60
            }
            

            
        }, completion: nil)
    }
}

