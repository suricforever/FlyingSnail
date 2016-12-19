//
//  FirstViewController.swift
//  FLyingSnail
//
//  Created by Suric on 16/9/25.
//  Copyright © 2016年 snail. All rights reserved.
//
import UIKit
class FirstViewController: UIViewController {
    @IBOutlet weak var modeLabel: UILabel!
    lazy var ChartViewColors: [UIColor] = self.createChartViewColors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
            modeLabel.text = "This is DEBUG mode"
        #elseif ADHOC
            modeLabel.text = "This is ADHOC mode"
        #else
            modeLabel.text = "This is RELEASE mode"
        #endif
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - IBActions
    @IBAction func buttonAction() {
    }
    
    private func createChartViewColors() -> [UIColor] {
        return [
            UIColor(red: 86/255, green: 84/255, blue: 124/255, alpha: 1),
            UIColor(red: 80/255, green: 88/255, blue: 92/255, alpha: 1),
            UIColor(red: 126/255, green: 191/255, blue: 189/255, alpha: 1),
            UIColor(red: 161/255, green: 77/255, blue: 63/255, alpha: 1),
            UIColor(red: 235/255, green: 185/255, blue: 120/255, alpha: 1),
            UIColor(red: 100/255, green: 126/255, blue: 159/255, alpha: 1),
            UIColor(red: 160/255, green: 209/255, blue: 109/255, alpha: 1),
        ]
    }
    
}
