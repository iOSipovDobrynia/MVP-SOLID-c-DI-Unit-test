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
    init(view: MainViewProtocol, networkManager: NetworkManagerProtocol)
    
    func fetchComments()
    var comments: [Comment]? {get set}
}

class MainPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewProtocol?
    let networkManager: NetworkManagerProtocol
    var comments: [Comment]?
    
    required init(view: MainViewProtocol, networkManager: NetworkManagerProtocol) {
        self.view = view
        self.networkManager = networkManager
        fetchComments()
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
