//
//  BMUIDecoratorCode.swift
//  BMUIDecorator
//
//  Created by LEE ZHE YU on 2019/6/23.
//

public typealias DecoratorCodeClosure = ((UIView, [String: Any]) -> Void)
public protocol BMUIDecoratorCode {
    func installTo(store: BMUIDecoratorStore)
    func decoratorCodeExpand(name: String, codeWithInfo: @escaping DecoratorCodeClosure, store: BMUIDecoratorStore)
}
public extension BMUIDecoratorCode {
    func decoratorCodeExpand(name: String, codeWithInfo: @escaping DecoratorCodeClosure, store: BMUIDecoratorStore) {
        if store.codeBase[name] != nil {
            store.codeBase[name]?.append(codeWithInfo)
        } else {
            store.codeBase[name] = [codeWithInfo]
        }
    }
}
