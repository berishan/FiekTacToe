//
//  HistoryTableViewCell.swift
//  tictactoe
//
//  Created by Nora Berisha on 3.10.21.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lblWinner: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
