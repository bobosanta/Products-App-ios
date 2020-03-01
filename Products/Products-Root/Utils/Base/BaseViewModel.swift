//
//  BaseViewModel.swift
//  Products
//
//  Created by bogdan razvan on 01/03/2020.
//  Copyright © 2020 Archlime. All rights reserved.
//

import Bond

protocol BaseViewModel {

    var error: Observable<GeneralError?> { get }

}

protocol EventTransmitter where Self: BaseViewModel {

    associatedtype Event

    var event: Observable<Event?> { get }

}
