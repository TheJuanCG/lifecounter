//
//  ViewController.swift
//  LifeCounter
//
//  Created by Juan Carlos Garcia on 4/22/25.
//

import UIKit

class ViewController: UIViewController {
    var player1Life = 20
    var player2Life = 20
    var players: [Int] = [20, 20, 20, 20]
    
    @IBOutlet weak var playersStackView: UIStackView!
    
    @IBOutlet weak var addPlayerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 1...4 {
            let playerView = createPlayerView(i)
            playersStackView.addArrangedSubview(playerView)
        }

    }
    
    @IBAction func addPlayerTapped(_ sender: Any) {
        if players.count < 8 {
            let playerView = createPlayerView(players.count + 1)
            playersStackView.addArrangedSubview(playerView)
            players.append(20)
        }
    }
    
    
    func createPlayerView(_ playerNumber: Int) -> UIView {
        let playerView = UIStackView()
        playerView.spacing = 1
        playerView.axis = .vertical
        playerView.alignment = .center
        
        let nameLabel = UILabel()
        nameLabel.text = "Player \(playerNumber)"
        nameLabel.setContentCompressionResistancePriority(.required, for: .vertical)

        
        let lifeLabel = UILabel()
        lifeLabel.text = "Life: 20"
        // use to identify later
        lifeLabel.tag = 100 + playerNumber
        lifeLabel.setContentCompressionResistancePriority(.required, for: .vertical)

        
        let changeAmountField = UITextField()
        changeAmountField.placeholder = "Amount"
        changeAmountField.keyboardType = .numberPad
        changeAmountField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        changeAmountField.heightAnchor.constraint(equalToConstant: 24).isActive = true
        changeAmountField.setContentCompressionResistancePriority(.required, for: .vertical)
        
        
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.spacing = 2
        
        let plusButton = UIButton(type: .system)
        plusButton.setTitle("+", for: .normal)
        plusButton.addAction(UIAction { _ in
            self.changeLife(for: playerNumber, isAdding: true, textField: changeAmountField, lifeLabel: lifeLabel)
        }, for: .touchUpInside)
        
        let minusButton = UIButton(type: .system)
        minusButton.setTitle("-", for: .normal)
        minusButton.addAction(UIAction { _ in
            self.changeLife(for: playerNumber, isAdding: false, textField: changeAmountField, lifeLabel: lifeLabel)
        }, for: .touchUpInside)
        
        // Shrinking for more size
        nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        lifeLabel.font = UIFont.systemFont(ofSize: 12)
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        minusButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        plusButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 24).isActive = true

        
        buttonStack.addArrangedSubview(plusButton)
        buttonStack.addArrangedSubview(minusButton)
        
        // Add everything to playerView
        playerView.addArrangedSubview(nameLabel)
        playerView.addArrangedSubview(lifeLabel)
        playerView.addArrangedSubview(changeAmountField)
        playerView.addArrangedSubview(buttonStack)
        
        return playerView
        
    }
    
    func changeLife(for playerNumber: Int, isAdding: Bool, textField: UITextField, lifeLabel: UILabel) {
        addPlayerButton.isEnabled = false
        let amount = Int(textField.text ?? "") ?? 0
        
        if isAdding {
            players[playerNumber - 1] += amount
        } else {
            players[playerNumber - 1] -= amount
        }
        lifeLabel.text = "Life: \(players[playerNumber - 1])"
        
        if players[playerNumber - 1] <= 0 {
            let statusLabel = UILabel()
            statusLabel.text = "Player \(playerNumber) LOSES!"
            playersStackView.addArrangedSubview(statusLabel)
        }

    }
    
}
