//
//  SplashViewModel.swift
//  Products
//
//  Created by Dan Pop on 10/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Bond

class SplashViewModel: BaseViewModel {
   
    var error = Observable<GeneralError?>(nil)
    private var repository: SplashRepository
    
    init(repository: SplashRepository) {
        self.repository = repository
    }
}
