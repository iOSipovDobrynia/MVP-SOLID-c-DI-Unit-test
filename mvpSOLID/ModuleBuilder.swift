//
//  ModuleBuilder.swift
//  mvpSOLID
//
//  Created by Goodwasp on 05.11.2023.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func CreateDetailModule(comment: Comment?) -> UIViewController
}

class ModuleBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkManager = NetworkManager()
        let presenter = MainPresenter(view: view, networkManager: networkManager)
        view.presenter = presenter
        
        return view
    }
    
    static func CreateDetailModule(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let networkManager = NetworkManager()
        let presenter = DetailPresenter(view: view, networkManager: networkManager, comment: comment)
        view.presenter = presenter
        
        return view
    }
}
