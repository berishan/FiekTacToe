//
//  HomePageController.swift
//  tictactoe
//
//  Created by Rinor Ahmeti on 29.9.21.
//

import UIKit

class HomePageController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var historyBtn: UIButton!
    
    @IBAction func play(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "playView") as! ViewController
        present(vc, animated: true)
     }

    @IBAction func showHistory(_ sender: UIButton) {
        
    }
    
    }
    
    
    
