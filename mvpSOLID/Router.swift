//
//  Router.swift
//  mvpSOLID
//
//  Created by Goodwasp on 06.12.2023.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initionalViewController()
    func showDetail(comment: Comment?)
    func popToRoot()
}

class Router: RouterProtocol {
    
    // MARK: - Properties
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    // MARK: - Initialization
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    // MARK: - Methods
    func initionalViewController() {
        if let navigationController = navigationController {
            guard let mainVC = assemblyBuilder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainVC]
        }
    }
    
    func showDetail(comment: Comment?) {
        if let navigationController = navigationController {
            guard let detailVC = assemblyBuilder?.createDetailModule(comment: comment, router: self) else { return }
            navigationController.pushViewController(detailVC, animated: true)
            navigationController.modalPresentationStyle = .fullScreen
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
