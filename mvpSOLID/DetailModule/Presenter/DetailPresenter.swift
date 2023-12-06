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
    init(view: DetailViewProtocol, networkManager: NetworkManagerProtocol, comment: Comment?, router: RouterProtocol)
    
    func setComment()
    func tap()
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    // MARK: - Properties
    weak var view: DetailViewProtocol?
    let networkManager: NetworkManagerProtocol
    var comment: Comment?
    var router: RouterProtocol?
    
    // MARK: - Initialization
    required init(view: DetailViewProtocol, networkManager: NetworkManagerProtocol, comment: Comment?, router: RouterProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.comment = comment
        self.router = router
    }
    
    // MARK: - Methods
    func setComment() {
        view?.set(comment: comment)
    }
    
    func tap() {
        router?.popToRoot()
    }
}
