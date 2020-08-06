//
//  QuestionViewController.swift
//  BVisualNovel
//
//  Created by Seonguk Jeong on 28/07/2020.
//  Copyright © 2020 Seonguk Jeong. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        choice1.layer.cornerRadius = 5
        choice2.layer.cornerRadius = 5
        choice3.layer.cornerRadius = 5
    }
    
    @IBAction func firstButton(_ sender: UIButton) {
        
        choice1.backgroundColor = UIColor.red
        choice1.setTitle("Wrong!", for: .normal)
   }
    
    @IBAction func secondButton(_ sender: UIButton) {

        choice2.backgroundColor = UIColor.red
        choice2.setTitle("Seriously?", for: .normal)
    }
    
    @IBAction func thirdButton(_ sender: UIButton) {

        choice3.backgroundColor = UIColor.green
        choice3.setTitle("Correct!", for: .normal)
        let alert = UIAlertController(title: "Correct!", message: "You can keep your journey!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in self.dismiss(animated: true, completion: nil)}))
        present(alert, animated: true)
    }
    
    func updateUI() {
        
        quizLabel.text = quizBrain.quiz[0].text
        choice1.setTitle(quizBrain.quiz[0].answer[0], for: .normal)
        choice2.setTitle(quizBrain.quiz[0].answer[1], for: .normal)
        choice3.setTitle(quizBrain.quiz[0].answer[2], for: .normal)
    }
}
