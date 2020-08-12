//
//  LoginViewModel.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Bond

class LoginViewModel: BaseViewModel, EventTransmitter {

    enum Event {
        case didLogin
    }

    // MARK: - Properties
    var error = Observable<GeneralError?>(nil)
    var event = Observable<Event?>(nil)
    var isRequestInProgress = Observable<Bool>(false)
//    var email = Observable<String?>(nil)
     var email = Observable<String?>("santamarian.bogdan+1@gmail.com")
//    var password = Observable<String?>(nil)
    var password = Observable<String?>("Test1234!")

    private var repository: LoginRepository

    // MARK: - Lifecycle
    init(repository: LoginRepository) {
        self.repository = repository
    }

    // MARK: - Internal
    func login() {
        guard let email = email.value, !email.isEmpty,
            let password = password.value, !password.isEmpty else {
                error.value = GeneralError(title: "invalid-credentials.title".localized, descr: "invalid-credentials.description".localized)
                return
        }
        isRequestInProgress.value = true
        let request = LoginRequest(email: email, password: password)
        repository.login(request: request) { [weak self] response in
            guard let self = self else { return }
            self.isRequestInProgress.value = false
            guard response.success else {
                self.error.value = GeneralError(title: "invalid-credentials.title".localized, descr: "invalid-credentials.description".localized)
                return
            }
            self.event.value = .didLogin
        }

    }

}
