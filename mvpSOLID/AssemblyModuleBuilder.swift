//
//  ModuleBuilder.swift
//  mvpSOLID
//
//  Created by Goodwasp on 05.11.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkManager = NetworkManager()
        let presenter = MainPresenter(view: view, networkManager: networkManager, router: router)
        view.presenter = presenter
        
        return view
    }
    
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkManager = NetworkManager()
        let presenter = DetailPresenter(view: view, networkManager: networkManager, comment: comment, router: router)
        view.presenter = presenter
        
        return view
    }
}
