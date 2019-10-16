//
//  LoginService.swift
//  HelloFreshv3
//
//  Created by Pablo de la Rosa Michicol on 10/7/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import Foundation
import RxSwift

protocol LoginServiceProtocol {
    func signIn(with credentials: Credentials) -> Observable<User>
}

class LoginService: LoginServiceProtocol {
    func signIn(with credentials: Credentials) -> Observable<User> {
        return Observable.create { observer in
            /*
             Networking logic here.
            */
            observer.onNext(User()) // Simulation of successful user authentication.
            return Disposables.create()
        }
    }
}
