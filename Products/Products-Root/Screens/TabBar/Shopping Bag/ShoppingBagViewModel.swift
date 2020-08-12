//
//  ShoppingBagViewModel.swift
//  Products
//
//  Created by Dan Pop on 12/08/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Bond

class ShoppingBagViewModel: BaseViewModel {
    
    var error = Observable<GeneralError?>(nil)
    private var respository: ShoppingBagRepository
    
    init(repository: ShoppingBagRepository) {
        self.respository = repository
    }
    
}
