//
//  ProductsViewModel.swift
//  Products
//
//  Created by Dan Pop on 12/08/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Bond

class ProductsViewModel: BaseViewModel {
    
    var error = Observable<GeneralError?>(nil)
    private var respository: ProductsRepository
    
    init(repository: ProductsRepository) {
        self.respository = repository
    }
    
}
