//
//  DetailViewController.swift
//  mvpSOLID
//
//  Created by Goodwasp on 06.11.2023.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var commentLabel: UILabel!
    
    // MARK: - Public properties
    var presenter: DetailViewPresenterProtocol!
    
    // MARK: - View's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.setComment()
    }
}

// MARK: - DetailViewProtocol
extension DetailViewController: DetailViewProtocol {
    func set(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
