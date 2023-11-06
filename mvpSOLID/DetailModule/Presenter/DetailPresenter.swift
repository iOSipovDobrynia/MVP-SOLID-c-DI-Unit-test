//
//  DetailPresenter.swift
//  mvpSOLID
//
//  Created by Goodwasp on 06.11.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func set(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkManager: NetworkManagerProtocol, comment: Comment?)
    
    func setComment()
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    let networkManager: NetworkManagerProtocol
    var comment: Comment?
    
    required init(view: DetailViewProtocol, networkManager: NetworkManagerProtocol, comment: Comment?) {
        self.view = view
        self.networkManager = networkManager
        self.comment = comment
    }
    
    func setComment() {
        view?.set(comment: comment)
    }
    
    
}
