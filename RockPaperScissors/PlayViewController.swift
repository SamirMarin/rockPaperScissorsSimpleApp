//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Samir Marin on 2015-12-01.
//  Copyright © 2015 Samir Marin. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    var userChoice: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //randomaly genarate numb 1, 2, 3 which
    //represent rock, paper, scissors respectively
    private func generateRandomPick()-> Int{
        let randomNumber = 1 + arc4random() % 3
        
        return Int(randomNumber)
        
    }
    //picks winner or tie
    // 1 computer wins
    // 2 user
    private func pickWinnerAndType()->String{
        if(generateRandomPick() == 1 && userChoice == 3){
            return "rock destroys scissors! you lose!"
        }
        else if(generateRandomPick() == 1 && userChoice == 2){
            return "paper covers rock! you win!"
        }
        else if(generateRandomPick() == 2 && userChoice == 1){
            return "paper covers rock! you lose!"
        }
        else{
            return "rock destroys scissors! you win!"
        }
    }

    @IBAction func rockPick(sender: UIButton) {
        userChoice = 1
        
    }
    
    @IBAction func paperPick(sender: UIButton) {
        userChoice = 2
    }
    

}

