//
//  Presenter.swift
//  CryptoApp-VIPER
//
//  Created by Bahittin on 27.10.2023.
//

import Foundation

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidDownloadCryptos(result: Result<[Crypto], Error>)
}

class CryptoPresenter: AnyPresenter {
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    
    var view: AnyView?
    
    func interactorDidDownloadCryptos(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            view?.Update(with: cryptos)
        case .failure(let error):
            view?.Update(with: error.localizedDescription)
        }
    }
}
