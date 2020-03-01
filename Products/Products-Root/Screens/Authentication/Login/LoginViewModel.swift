//
//  LoginViewModel.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Bond
import Firebase

class LoginViewModel: BaseViewModel, EventTransmitter {

    enum Event {
        case didLogin
    }

    // MARK: - Properties
    var error = Observable<GeneralError?>(nil)
    var event = Observable<Event?>(nil)
    var isRequestInProgress = Observable<Bool>(false)
    var email = Observable<String?>(nil)
    var password = Observable<String?>(nil)

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
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            self.isRequestInProgress.value = false
            if error != nil {
                self.error.value = GeneralError(title: "invalid-credentials.title".localized, descr: "user-not-found".localized)
            } else {
                self.event.value = .didLogin
            }

        }

    }

    //TODO: remove
    func getPosts() {
        repository.getPosts { [weak self] response in
            guard let self = self, let responseData = response.data else { return }
            print(responseData?.count)
        }
    }

}
