//
//  ViewController.swift
//  tictactoe
//
//  Created by Nora Berisha on 28.9.21.
//

import UIKit

class ViewController: UIViewController {
    enum Turn {
        case X
        case O
    }

    @IBOutlet weak var turnLbl: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var firstTurn = Turn.X
    var currentTurn = Turn.X
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func boardClickedAction(_ sender: UIButton) {
        putOnBoard(sender)
    }
    
    func putOnBoard(_ sender: UIButton) {
        if(sender.title(for: .normal) == nil){
            
            if(currentTurn == Turn.O){
                sender.setTitle("O", for: .normal)
                sender.setTitleColor(.blue, for: .normal)
                currentTurn = Turn.X
        
                turnLbl.text = "X"
            }
            else if(currentTurn == Turn.X){
                sender.setTitle("X", for: .normal)
                sender.setTitleColor(.orange, for: .normal)
                currentTurn = Turn.O
                turnLbl.text = "O"
            }
            sender.isEnabled = false
        }
    }
    
}

