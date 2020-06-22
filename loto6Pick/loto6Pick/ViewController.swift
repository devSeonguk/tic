//
//  ViewController.swift
//  loto6Pick
//
//  Created by Seonguk Jeong on 19/06/2020.
//  Copyright © 2020 Seonguk Jeong. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var lottoBallCount = 0
    var lottoNumbers = 0
    var lottoPickedNumbers: [Int] = []
    var player: AVAudioPlayer!
    
    @IBOutlet weak var firstNumber: UIImageView!
    @IBOutlet weak var secondNumber: UIImageView!
    @IBOutlet weak var thirdNumber: UIImageView!
    @IBOutlet weak var fourthNumber: UIImageView!
    @IBOutlet weak var fifthNumber: UIImageView!
    @IBOutlet weak var sixthNumber: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
            reset()
    }

    @IBAction func getNumberPressed(_ sender: UIButton) {
        //Action when users press the clover button
        
        getRandomNumber()
        
        if lottoPickedNumbers.contains(lottoNumbers) {
            print("\(lottoNumbers) is already in the list")
        } else {
            lottoPickedNumbers.append(lottoNumbers)
            switch lottoBallCount {
            case 0:
                firstNumber.image = UIImage(systemName: "\(lottoPickedNumbers[0]).circle.fill")
                UIView.animate(withDuration: 0.5, animations:{
                    self.firstNumber.frame.origin.y -= 10
                })
            case 1:
                secondNumber.image = UIImage(systemName: "\(lottoPickedNumbers[1]).circle.fill")
                UIView.animate(withDuration: 0.5, animations:{
                    self.secondNumber.frame.origin.y -= 10
                })
            case 2:
                thirdNumber.image = UIImage(systemName: "\(lottoPickedNumbers[2]).circle.fill")
                UIView.animate(withDuration: 0.5, animations:{
                    self.thirdNumber.frame.origin.y -= 10
                })
            case 3:
                fourthNumber.image = UIImage(systemName: "\(lottoPickedNumbers[3]).circle.fill")
                UIView.animate(withDuration: 0.5, animations:{
                    self.fourthNumber.frame.origin.y -= 10
                })
            case 4:
                fifthNumber.image = UIImage(systemName: "\(lottoPickedNumbers[4]).circle.fill")
                UIView.animate(withDuration: 0.5, animations:{
                    self.fifthNumber.frame.origin.y -= 10
                })
            case 5:
                sixthNumber.image = UIImage(systemName: "\(lottoPickedNumbers[5]).circle.fill")
                UIView.animate(withDuration: 0.5, animations:{
                    self.sixthNumber.frame.origin.y -= 10
                })
            default:
                print("Restart for Billion Dollars!")
                let alert = UIAlertController(title: "Lucky 6 Numbers!", message: "\(lottoPickedNumbers.dropLast())", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Try Again!", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            lottoBallCount += 1
            let url = Bundle.main.url(forResource: "lucky", withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }
        
        if lottoBallCount - 1 == 6 {
            reset()
            finalAudioPlay()
            lottoPickedNumbers.removeAll()
            
        }
        print(lottoPickedNumbers)
    }
    
    func getRandomNumber() {
        lottoNumbers = Int.random(in: 1...45)
    }
    
    func reset() {
        lottoBallCount = 0
        
        firstNumber.frame.origin.y += 10
        secondNumber.frame.origin.y += 10
        thirdNumber.frame.origin.y += 10
        fourthNumber.frame.origin.y += 10
        fifthNumber.frame.origin.y += 10
        sixthNumber.frame.origin.y += 10
        
        print("Reset")
       
        firstNumber.image = UIImage(systemName: "7.circle.fill")
        secondNumber.image = UIImage(systemName: "7.circle.fill")
        thirdNumber.image = UIImage(systemName: "7.circle.fill")
        fourthNumber.image = UIImage(systemName: "7.circle.fill")
        fifthNumber.image = UIImage(systemName: "7.circle.fill")
        sixthNumber.image = UIImage(systemName: "7.circle.fill")
    }
    
    func finalAudioPlay() {
        let url = Bundle.main.url(forResource: "lucky6", withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
    }
}

