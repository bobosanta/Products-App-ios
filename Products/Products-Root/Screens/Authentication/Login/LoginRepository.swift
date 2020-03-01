//
//  LoginRepository.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Foundation

protocol LoginRepository: APIClient {
    func getPosts(completion: @escaping (APIResponse<[Post]?>) -> Void)
}

class LoginRepositoryImpl: LoginRepository {

    func getPosts(completion: @escaping (APIResponse<[Post]?>) -> Void) {
        performRequest(route: APIRouter.getPosts, completion: completion)
    }

}
