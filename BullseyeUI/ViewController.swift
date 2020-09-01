//
//  ViewController.swift
//  BullseyeUI
//
//  Created by Thanh Pham on 8/30/20.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue:  Int = 50
    var targetValue = 0
    var score = 0
    var round = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak  var scoreLabel : UILabel!
    @IBOutlet  weak var roundLabel:  UILabel!
    @IBAction func  showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        let action =  UIAlertAction(title: "OK",
                                    style: .default,
                                    handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
}
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value  =  Float(currentValue)
        updateLabels()
}
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}
