//
//  MainPresenter.swift
//  MVP по SOLID c DI и Unit test
//
//  Created by Goodwasp on 05.11.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func set(greeting: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person)
    
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    
    let view: MainViewProtocol
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = person.firstName + " " + person.lastName
        view.set(greeting: greeting)
    }
}
