//
//  MainPresenter.swift
//  mvpSOLID
//
//  Created by Goodwasp on 05.11.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol)
    
    func fetchComments()
    var comments: [Comment]? {get set}
    
    func tapOnTheComment(comment: Comment?)
}

class MainPresenter: MainViewPresenterProtocol {
    
    // MARK: - Properties
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    let networkManager: NetworkManagerProtocol
    var comments: [Comment]?
    
    // MARK: - Initialization
    required init(view: MainViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
        fetchComments()
    }

    // MARK: - Methods
    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }

    func fetchComments() {
        networkManager.fetchComments { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self?.comments = comments
                    self?.view?.success()
                case .failure(let error):
                    self?.view?.failure(error: error)
                }
            }
        }
    }
}
