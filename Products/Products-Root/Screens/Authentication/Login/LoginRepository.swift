//
//  LoginRepository.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Foundation

protocol LoginRepository: APIClient {
    func login(request: LoginRequest, completion: @escaping (APIResponse<Member?>) -> Void)
}

class LoginRepositoryImpl: LoginRepository {

    func login(request: LoginRequest, completion: @escaping (APIResponse<Member?>) -> Void) {
        performRequest(route: APIRouter.login(request: request), completion: completion)
    }

}
