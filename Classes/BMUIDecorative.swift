//
//  BMUIDecorative.swift
//  BMUIDecorator
//
//  Created by LEE ZHE YU on 2019/6/23.
//

public protocol BMUIDecorative {
    func decoratorActive(decoratorInfos: [BMUIDecoratorInfoName], storeManager: BMUIDecoratorStoresManager)
    func decoratorActive(decoratorTags: [String], storeName: String, storeManager: BMUIDecoratorStoresManager)
}

public extension BMUIDecorative {
    func decoratorActive(decoratorInfos: [BMUIDecoratorInfoName], storeManager: BMUIDecoratorStoresManager = .default) {
        guard let view = self as? UIView else {
            return
        }
        decoratorInfos.forEach { (tagInfo) in
            let store = storeManager.getStore(tagInfo.storeName())
            store.tagsInfo.filter({ tagInfo.tagName() == $0.key }).forEach { (tagInfo) in
                if let info = tagInfo.value as? [String: Any] {
                    info.forEach({ element in
                        store.codeBase[element.key]?.forEach({ (closure) in
                            closure(view, (element.value as? [String: Any]) ?? [String: Any]())
                        })
                    })
                }
            }
        }
    }
    func decoratorActive(decoratorTags: [String], storeName: String, storeManager: BMUIDecoratorStoresManager = .default) {
        guard let view = self as? UIView else {
            return
        }
        let store = storeManager.getStore(storeName)
        decoratorTags.forEach { (tagName) in
            store.tagsInfo.filter({ tagName == $0.key }).forEach { (tagInfo) in
                if let info = tagInfo.value as? [String: Any] {
                    info.forEach({ element in
                        store.codeBase[element.key]?.forEach({ (closure) in
                            closure(view, (element.value as? [String: Any]) ?? [String: Any]())
                        })
                    })
                }
            }
        }
    }
}
