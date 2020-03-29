//
//  RegisterViewModel.swift
//  Products
//
//  Created by Dan Pop on 13/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Bond

class RegisterViewModel: BaseViewModel {
   
    // MARK: - Properties
    var error = Observable<GeneralError?>(nil)
    private var repository: RegisterRepository
    
    // MARK: Lifecycle
    init(repository: RegisterRepository) {
        self.repository = repository
    }
}

