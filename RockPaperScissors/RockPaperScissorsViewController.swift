//
//  RockOrPaperOrScissorsViewController.swift
//  RockPaperScissors
//
//  Created by Samir Marin on 2015-12-01.
//  Copyright © 2015 Samir Marin. All rights reserved.
//

import UIKit

class RockPaperScissorViewController: UIViewController{
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var display: UILabel!
    
    
    var result: String?
    var rockPaperScissor: Int?
    
    override func viewWillAppear(animated: Bool) {
        if let labelResult = self.result{
            display.text = labelResult
        }
        else{
            display.text = "Something actually went wrong it's not actually a tie :("
        }
        if let choice = self.rockPaperScissor{
            if(choice == 1){
                resultImage.image = UIImage(named: "PaperWinsToRock")
                
            }
            else if(choice == 2){
                resultImage.image = UIImage(named: "RockWinsToScissors")
            }
            else if(choice == 3){
                resultImage.image = UIImage(named: "ScissorWinsToPaper")
            }
        }
        else{
            resultImage.image = UIImage(named: "Tie")
        }
    }
}


