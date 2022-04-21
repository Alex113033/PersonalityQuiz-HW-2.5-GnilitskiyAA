//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {

    var receivers: [Answer] = []
    
    @IBOutlet var userAnimal: UILabel!
    @IBOutlet var userDescription: UILabel!
    
    private var dogCoin = 0
    private var catCoin = 0
    private var rabbitCoin = 0
    private var turtleCoin = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        assignCoin()
        finalQ()
    }
    
    // MARK: - private func
    private func finalQ () {
        if dogCoin > catCoin, dogCoin > turtleCoin, dogCoin > rabbitCoin {
            userAnimal.text = "Вы - \(Animal.dog.rawValue)"
            userDescription.text = "\(Animal.dog.definition)"
        } else if catCoin > dogCoin, catCoin > turtleCoin, catCoin > rabbitCoin  {
            userAnimal.text = "Вы - \(Animal.cat.rawValue)"
            userDescription.text = "\(Animal.cat.definition)"
        } else if rabbitCoin > catCoin, rabbitCoin > turtleCoin, rabbitCoin > dogCoin  {
            userAnimal.text = "Вы - \(Animal.rabbit.rawValue)"
            userDescription.text = "\(Animal.rabbit.definition)"
        } else if turtleCoin > catCoin, turtleCoin > dogCoin, turtleCoin > rabbitCoin  {
            userAnimal.text = "Вы - \(Animal.turtle.rawValue)"
            userDescription.text = "\(Animal.turtle.definition)"
        }
    }
    
    private func assignCoin () {
        for receiver in receivers {
            switch receiver.animal {
            case .dog:
                if receiver.title == "Стейк" {
                    dogCoin += 2
                } else if receiver.title == "Плавать"  {
                    dogCoin += 3
                } else if receiver.title == "Обожаю" {
                    dogCoin += 4
                }
            case .cat:
                if receiver.title == "Рыба" {
                    catCoin += 2
                } else if receiver.title == "Спать" {
                    catCoin += 3
                } else if receiver.title == "Ненавижу" {
                    catCoin += 4
                }
            case .rabbit:
                if receiver.title == "Морковь" {
                    rabbitCoin += 2
                } else if receiver.title == "Обнимать" {
                    rabbitCoin += 3
                } else if receiver.title == "Нервничаю" {
                    rabbitCoin += 4
                }
            case .turtle:
                if receiver.title == "Кукуруза" {
                    turtleCoin += 2
                } else if receiver.title == "Есть" {
                    turtleCoin += 3
                } else if receiver.title == "Не замечаю" {
                    turtleCoin += 4
                }
            }
        }
    }
}
