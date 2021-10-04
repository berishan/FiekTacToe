//
//  HistoryController.swift
//  tictactoe
//
//  Created by Nora Berisha on 2.10.21.
//

import UIKit
import Foundation
import RealmSwift


class HistoryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let realm = try! Realm()
    let myData = HelperClass.test()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        let nib = UINib(nibName: "HistoryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HistoryTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return myData.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm E, d MMM y"
    cell.lblWinner.text = myData[indexPath.row].winner
    cell.lblDate.text = formatter.string(from: myData[indexPath.row].date!)
    return cell
}
    
}

class HelperClass {
    static func test() -> List<TicTacToeDb> {
        let winnersResult = try! Realm().objects(TicTacToeDb.self)
        let winners: List<TicTacToeDb> = List()
        for result in winnersResult{
            let ticTacToeDb = TicTacToeDb()
            ticTacToeDb.winner = result.winner
            ticTacToeDb.date = result.date
            winners.append(ticTacToeDb)
        }
        return winners
    }
}
