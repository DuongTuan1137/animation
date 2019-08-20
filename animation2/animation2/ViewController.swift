//
//  ViewController.swift
//  animation2
//
//  Created by AnhDCT on 8/14/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let numberView = 30
        let viewSize = view.frame.width/CGFloat(numberView)
        for i in 0..<numberView {
            let v = UIImageView()
            
            v.image = UIImage(named: "h20")
            
            v.frame = CGRect(x: CGFloat(i) * viewSize, y: -50, width: viewSize, height: viewSize * 2)
            view.addSubview(v)
            
            UIView.animate(withDuration: 3, delay: drand48()*5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .repeat, animations: {
                v.frame = CGRect(x: CGFloat(i)*viewSize, y: 1000, width: viewSize, height: viewSize*2)
            }, completion: nil)
        }
    }
    
        

}

