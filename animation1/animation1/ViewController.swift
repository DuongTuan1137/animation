//
//  ViewController.swift
//  animation1
//
//  Created by AnhDCT on 8/14/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handelAnimate)))
        // Do any additional setup after loading the view.
    }
    @objc func handelAnimate(){
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.sView.frame = CGRect(x: self.view.frame.width - self.sView.frame.width, y:  self.view.frame.height - self.sView.frame.height, width: self.sView.frame.width, height: self.sView.frame.height)
            self.sView.backgroundColor = .red
            self.sView.layer.borderWidth = 5
            self.sView.layer.cornerRadius = 50
            self.sView.layer.shadowColor = UIColor.black.cgColor
            
        }, completion: nil)
    }


}

