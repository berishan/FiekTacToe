//
//  ViewController.swift
//  tictactoe
//
//  Created by Nora Berisha on 28.9.21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    let realm = try! Realm()
    
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
    var table = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
    }

    func initTable(){
        table.append(a1)
        table.append(a2)
        table.append(a3)
        table.append(b1)
        table.append(b2)
        table.append(b3)
        table.append(c1)
        table.append(c2)
        table.append(c3)
    }
    
    func save(obj: TicTacToeDb) {
        realm.beginWrite()
        realm.add(obj)
        try! realm.commitWrite()
    }
    
    @IBAction func tableClickedAction(_ sender: UIButton) {
        putOnTable(sender)
        let winner = TicTacToeDb()
        if (checkForVictory("X")){
            resultAlert(title: "X has won")
            save(obj: winner)
            // save to db
        } else if (checkForVictory("O")){
            resultAlert(title: "O has won")
            winner.winner = "O"
            winner.date = Date()
            save(obj: winner)
            // save to db
        }
        if (tableIsFull()){
            resultAlert(title: "Draw")
            // po gjun exception n draw duhet me shiku, nashta duhet ni koneksion me bo mrena qitu
//            winner.winner = "DRAW"
//            winner.date = Date()
//            realm.beginWrite()
//            realm.add(winner)
//            try! realm.commitWrite()
            // todo: save to db
        }
    }
    func resultAlert(title: String){
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetTable()
        }))
        self.present(ac, animated: true)
    }
    
    func checkForVictory(_ s: String) -> Bool{
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s){
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s){
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s){
            return true
        }
        
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s){
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s){
            return true
        }
        
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s){
            return true
        }
    
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    func resetTable(){
        for button in table {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        
    }
    func tableIsFull() -> Bool {
        for button in table {
            if(button.title(for: .normal) == nil){
                return false
            }
        }
        return true
    }
    
    func putOnTable(_ sender: UIButton) {
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

class TicTacToeDb: Object {
    @objc dynamic var winner: String?
    @objc dynamic var date: Date?
}

