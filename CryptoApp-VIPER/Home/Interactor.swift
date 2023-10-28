//
//  Interactor.swift
//  CryptoApp-VIPER
//
//  Created by Bahittin on 27.10.2023.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func downloadCryptos()
}

class CryptoInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        guard let url = URL(string: Constants.apiUrl) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidDownloadCryptos(result: .failure(NetworkError.NetworkFailed))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode([Crypto].self, from: data)
                self?.presenter?.interactorDidDownloadCryptos(result: .success(decodedData))
            } catch {
                self?.presenter?.interactorDidDownloadCryptos(result: .failure(NetworkError.ParsingError))
            }
        }
        task.resume()
    }
}
