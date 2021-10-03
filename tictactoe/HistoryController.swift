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
    cell.lblWinner.text = myData[indexPath.row]
    cell.lblDate.text = myData[indexPath.row]
    return cell
}
    
}

class HelperClass {
    static func test() -> List<String> {
        let winners = try! Realm().objects(TicTacToeDb.self)
        let test: List<String> = List()
        for winner in winners {
            let testi = winner.winner ?? "lala" + " has won on " + (winner.date?.description)!
            test.append(testi)
        }
        return test
    }
}
