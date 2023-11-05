//
//  ModuleBuilder.swift
//  MVP по SOLID c DI и Unit test
//
//  Created by Goodwasp on 05.11.2023.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "David", lastName: "Blaine")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        
        return view
    }
}
