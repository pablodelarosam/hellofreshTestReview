//
//  Observable+Extensions.swift
//  HelloFreshv3
//
//  Created by Pablo de la Rosa Michicol on 10/15/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import Foundation
import UIKit
import RxSwift


public protocol OptionalType {
    associatedtype Wrapped
    
    var optional: Wrapped? { get }
}


// Avoid ambiguous reference of text
extension Optional: OptionalType {
    public var optional: Wrapped? { return self }
}

extension Observable where Element: OptionalType {
    func ignoreNil() -> Observable<Element.Wrapped> {
        return flatMap { value in
            value.optional.map { Observable<Element.Wrapped>.just($0) } ?? Observable<Element.Wrapped>.empty()
        }
    }
}
