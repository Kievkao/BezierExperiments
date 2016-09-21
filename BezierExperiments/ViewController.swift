//
//  ViewController.swift
//  BezierExperiments
//
//  Created by Kravchenko, Andrii on 9/21/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(BezierTestView(frame: view.bounds))
    }

}

