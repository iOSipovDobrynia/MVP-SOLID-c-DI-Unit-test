//
//  MainViewController.swift
//  mvpSOLID
//
//  Created by Goodwasp on 05.11.2023.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var greetingLabel: UILabel!
    
    // MARK: - Public properties
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    @IBAction func buttondDidTapped(_ sender: Any) {
        presenter.showGreeting()
    }

}

// MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
    func set(greeting: String) {
        greetingLabel.text = greeting
    }
}
