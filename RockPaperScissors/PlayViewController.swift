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
    var paperRockScissor: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        userChoice = nil
        paperRockScissor = nil
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
        let compChoice = generateRandomPick()
        if(compChoice == 1 && userChoice == 3){
            paperRockScissor = 1
            return "rock destroys scissors! you lose!"
        }
        else if(compChoice == 1 && userChoice == 2){
            paperRockScissor = 2
            return "paper covers rock! you win!"
        }
        else if(compChoice == 2 && userChoice == 1){
            paperRockScissor = 2
            return "paper covers rock! you lose!"
        }
        else if(compChoice == 2 && userChoice == 3){
            paperRockScissor = 3
            return "scissor cuts paper! you win!"
        }
        else if(compChoice == 3 && userChoice == 1){
            paperRockScissor = 1
            return "rock destroys scissors! you win!"
        }
        else if(compChoice == 3 && userChoice == 2){
            paperRockScissor = 3
            return "scissor cuts paper! you lose!"
        }
        else{
            paperRockScissor = nil
            return "it's a TIE!!!"
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "paperPick"{
            let controller = segue.destinationViewController as! RockPaperScissorViewController
            setControllerVar(controller)
            
            
    }
        else if segue.identifier == "scissorPick"{
            userChoice = 3
            let controller = segue.destinationViewController as! RockPaperScissorViewController
            setControllerVar(controller)
            
            
        }
    }
    
    private func setControllerVar(controller: RockPaperScissorViewController){
        controller.result = pickWinnerAndType()
        controller.rockPaperScissor = self.paperRockScissor
        
    }
    
    

    @IBAction func rockPick(sender: UIButton) {
        userChoice = 1
        let controller: RockPaperScissorViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("RockPaperScissorViewController") as! RockPaperScissorViewController
        setControllerVar(controller)
        
        self.presentViewController(controller, animated: true, completion: nil)
        
        
    }
    
    @IBAction func paperPick(sender: UIButton) {
        userChoice = 2
        performSegueWithIdentifier("paperPick", sender: self)
    }
    

}

