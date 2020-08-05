//
//  YesViewController.swift
//  곤봉강화
//
//  Created by Seonguk Jeong on 04/08/2020.
//  Copyright © 2020 Seonguk Jeong. All rights reserved.
//

import UIKit

class YesViewController: UIViewController {
    
    var enchantValue: String?

    @IBOutlet weak var yesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yesLabel.text = enchantValue
    }
}
