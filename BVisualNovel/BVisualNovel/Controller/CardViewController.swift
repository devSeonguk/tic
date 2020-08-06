//
//  CardViewController.swift
//  BVisualNovel
//
//  Created by Seonguk Jeong on 28/07/2020.
//  Copyright © 2020 Seonguk Jeong. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardText.font = UIFont(name: "BlackHanSans-Regular", size: 26)
    }
    
}
