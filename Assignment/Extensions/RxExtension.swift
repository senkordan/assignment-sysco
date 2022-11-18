//
//  RxExtension.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: Label {
    var text: Binder<String?> {
        return Binder(base) { label, text in
            label.setText(text ?? "")
        }
    }
}

extension ObservableType {
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { _ in
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
    
    func ignoreNil() -> Observable<Element> {
        return flatMap { Observable.from(optional: $0) }
    }
}

