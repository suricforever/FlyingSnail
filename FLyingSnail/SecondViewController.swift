//
//  SecondViewController.swift
//  FLyingSnail
//
//  Created by Suric on 16/9/25.
//  Copyright © 2016年 snail. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var first: String?
    var third: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print("nice \(FirstViewController().ChartViewColors)")
        print("nice \(FirstViewController().ChartViewColors)")
        testNilCoalescing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func testNilCoalescing() {
        print("Begin test")
    }
    
}

