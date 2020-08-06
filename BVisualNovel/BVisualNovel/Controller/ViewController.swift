//
//  ViewController.swift
//  BVisualNovel
//
//  Created by Seonguk Jeong on 24/07/2020.
//  Copyright © 2020 Seonguk Jeong. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var bgView: UIImageView!
    @IBOutlet weak var personView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dialogueView: UITextView!
    
    var player: AVAudioPlayer!
    
    var tapCount = 0
    
    
    let dialoguesWitch = ["(Witch Dialogue 01)", "(Witch Dialogue 02)", "(Witch Dialogue 03)"]
    let dialogues1 = ["(Girl Dialogue 01)", "(Girl Dialogue 02)", "(Girl Dialogue 03)", "(Girl Dialogue 04)"]
    let dialogues2 = ["(Boy Dialogue 01)", "(Boy Dialogue 02)", "(Boy Dialogue 03)", "(Boy Dialogue 04)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayLabel.alpha = 0.0
        locationLabel.alpha = 0.0
        dialogueView.alpha = 0.0
        
        dialogueView.layer.borderWidth = 2
        dialogueView.layer.borderColor = UIColor.white.cgColor
        dialogueView.layer.cornerRadius = 5
    }
    
    @IBAction func forwardButton(_ sender: UIButton) {
        
        tapCount += 1
        tappedButton()
    }
    
    @IBAction func backwardButton(_ sender: UIButton) {
        
        tapCount -= 1
        tappedButton()
    }
    
    func tappedButton() {

        if tapCount == 1 {
            playMainSound()
            dayLabel.alpha = 1.0
            locationLabel.alpha = 1.0
            dialogueView.alpha = 1.0
            bgView.image = #imageLiteral(resourceName: "carlisleAvenue")
            dialogueView.text = dialoguesWitch[0]
            personView.image = #imageLiteral(resourceName: "witch")
        } else if tapCount == 2 {
            dialogueView.text = dialoguesWitch[1]
            bgView.image = #imageLiteral(resourceName: "carlisle")
            personView.image = #imageLiteral(resourceName: "witch")
        } else if tapCount == 3 {
            playSecondSound()
            dayLabel.text = "20XX년 XX월 XX일"
            locationLabel.text = "@LOCATION"
            bgView.image = #imageLiteral(resourceName: "peloapelo")
            dialogueView.text = dialoguesWitch[2]
            personView.image = #imageLiteral(resourceName: "witch")
        } else if tapCount == 4 {
            dialogueView.text = dialogues1[0]
            personView.image = #imageLiteral(resourceName: "girl")
        } else if tapCount == 5 {
            dialogueView.text = dialogues1[1]
            personView.image = #imageLiteral(resourceName: "girl")
        } else if tapCount == 6 {
            dialogueView.text = dialogues2[0]
            personView.image = #imageLiteral(resourceName: "boy")
        } else if tapCount == 7 {
            bgView.image = #imageLiteral(resourceName: "peloapelo")
            dialogueView.isHidden = false
            personView.isHidden = false
            dialogueView.text = dialogues2[1]
            personView.image = #imageLiteral(resourceName: "boy")
        } else if tapCount == 8 {
            playTwoHoursSound()
            dialogueView.isHidden = true
            personView.isHidden = true
            bgView.image = #imageLiteral(resourceName: "two")
        } else if tapCount == 9 {
            playLastSound()
            bgView.image = #imageLiteral(resourceName: "peloapelo")
            dialogueView.isHidden = false
            personView.isHidden = false
            dialogueView.text = dialogues2[2]
            personView.image = #imageLiteral(resourceName: "boy")
        } else if tapCount == 10 {
            bgView.image = #imageLiteral(resourceName: "peloapelo")
            locationLabel.text = "@LOCATION"
            dialogueView.text = dialogues1[2]
            personView.image = #imageLiteral(resourceName: "girl")
        } else if tapCount == 11 {
            locationLabel.text = "@LOCATION"
            bgView.image = #imageLiteral(resourceName: "youngjabeer")
            dialogueView.text = dialogues1[3]
            personView.image = #imageLiteral(resourceName: "girl")
        } else if tapCount == 12 {
            dialogueView.text = dialogues2[3]
            personView.image = #imageLiteral(resourceName: "boy")
        } else if tapCount == 13 {
            let questionVC = storyboard?.instantiateViewController(identifier: "questionVC") as! QuestionViewController
            present(questionVC, animated: true)
        } else if tapCount == 14 {
            let vc = storyboard?.instantiateViewController(identifier: "cardVC") as! CardViewController
            present(vc, animated: true)
            playBirthdaySound()
        } else if tapCount <= 0 || tapCount >= 15 {
            tapCount = 1
        }
    }
    
    @IBAction func restartButton(_ sender: UIButton) {
        tapCount = 1
        tappedButton()
    }
    
    func playMainSound() {
       let url = Bundle.main.url(forResource: "opening", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
    }
    
    func playSecondSound() {
        let url = Bundle.main.url(forResource: "second", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func playBirthdaySound() {
        let url = Bundle.main.url(forResource: "birthday", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func playTwoHoursSound() {
        let url = Bundle.main.url(forResource: "twoHours", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func playLastSound() {
          let url = Bundle.main.url(forResource: "last", withExtension: "mp3")
          player = try! AVAudioPlayer(contentsOf: url!)
          player.play()
    }
}
