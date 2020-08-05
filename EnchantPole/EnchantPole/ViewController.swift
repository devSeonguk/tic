//
//  ViewController.swift
//  곤봉강화
//
//  Created by Seonguk Jeong on 04/08/2020.
//  Copyright © 2020 Seonguk Jeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var enchantMessageLabel: UILabel!
    @IBOutlet weak var enchantCountLabel: UILabel!
    @IBOutlet weak var enchantScroll: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackDamage: UILabel!
    @IBOutlet weak var buyButtonLabel: UIButton!
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var sellButtonLabel: UIButton!
    
    var enchantScrollCount = 10
    var enchant = 0
    var enchantCount = 0
    var damage = 10
    var coin = 1000
    var enchantScrollCountFromSenior = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buyButtonLabel.layer.cornerRadius = 5
        sellButtonLabel.layer.cornerRadius = 5
        
        buyButtonLabel.titleEdgeInsets.left = 5
        buyButtonLabel.titleEdgeInsets.right = 5
        sellButtonLabel.titleEdgeInsets.left = 5
        sellButtonLabel.titleEdgeInsets.right = 5
        
    }
    
    @IBAction func enchantButtonPressed(_ sender: UIButton) {
        
        if enchantScrollCount > 0 {
            
            let poleWeight = Int.random(in: 200...800)
            weightLabel.text = "무게: \(poleWeight)g"
            
            if poleWeight < 250 {
                let alert = UIAlertController(title: "\(poleWeight)g! 가벼운 곤봉 획득!", message: "무게가 가볍습니다. 고참에게 주시겠습니까?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "네", style: .default, handler: { action in self.acceptAlert()}))
                alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: { action in self.denyAlert()}))
                self.present(alert, animated: true)
            }
            
            enchantScrollCount -= 1
            enchantScroll.text = "데이엔 푸엘스: \(enchantScrollCount)"
            
            enchantCount += 1
            enchantCountLabel.text = "강화 횟수: \(enchantCount)"
            
            let enchantPercentage = Int.random(in: 1...100)
            print(enchantPercentage)
            
            if enchantPercentage < 51 && enchant <= 6 {
                
                enchant += 1
                itemLabel.text = "+\(enchant) 방범용 곤봉"
                enchantMessageLabel.text = "강화에 성공하셨습니다."
                
            } else if enchantPercentage >= 51 && enchant > 6 {
                
                enchant -= 1
                itemLabel.text = "+\(enchant) 방범용 곤봉"
                enchantMessageLabel.text = "강화에 실패하셨습니다."
                
            } else {
                
                enchant += 1
                itemLabel.text = "+\(enchant) 방범용 곤봉"
                enchantMessageLabel.text = "강화에 성공하셨습니다."
            }
        } else {
            enchantMessageLabel.text = "데이가 없군요? 지갑을 열어보시겠습니까?"
        }
        
        let damageResult = damage * (enchant * enchant + (enchant + enchant))
        
        attackDamage.text = "공격력: \(damageResult)"
     
    }
    
    @IBAction func buyButtonPressed(_ sender: UIButton) {
        buyEnchantScroll()
    }
    func buyEnchantScroll() {
        if coin >= 1000 {
            enchantScrollCount += 10
            enchantScroll.text = "데이엔 푸엘스: \(enchantScrollCount)"
            coin -= 1000
            coinLabel.text = "아데나: \(coin)"
        } else {
            
        }
    }
    
    @IBAction func sellButtonPressed(_ sender: UIButton) {
        if enchant > 0 {
            coin = (enchant + enchant) * 100
            coinLabel.text = "아데나: \(coin)"
            reset()
        }
    }
    
    func denyAlert() {
        performSegue(withIdentifier: "noSegue", sender: nil)
    }
    
    func acceptAlert() {
        enchantScrollCountFromSenior = 2 * Int.random(in: 1...enchant)
        print("Enchant Scrolls From Senior: \(enchantScrollCountFromSenior)")
        enchantScrollCount += enchantScrollCountFromSenior
        enchantScroll.text = "데이엔 푸엘스: \(enchantScrollCount)"
        performSegue(withIdentifier: "yesSegue", sender: nil)
        reset()
    }
    
    func reset() {
        enchant = 0
        damage = 10
        itemLabel.text = "+0 방범용 곤봉"
        weightLabel.text = "무게: 0g"
        enchantMessageLabel.text = "강해지고 싶나?"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // To deliver the value to segue.
        if segue.identifier == "yesSegue" {
            let destinationVC = segue.destination as! YesViewController
            destinationVC.enchantValue = "넌 이제 내 라인이다!\n데이엔 푸엘스 \(enchantScrollCountFromSenior) 을/를 얻었습니다."
        }
    }

}
