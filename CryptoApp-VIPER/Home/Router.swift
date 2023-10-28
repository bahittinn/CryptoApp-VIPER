//
//  Router.swift
//  CryptoApp-VIPER
//
//  Created by Bahittin on 27.10.2023.
//

import Foundation

protocol AnyRouter {
    static func startExecution() -> AnyRouter
}

class CryptoRouter: AnyRouter {
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        return router
    }
}
