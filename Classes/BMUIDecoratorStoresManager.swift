//
//  BMUIDecoratorStoresManager.swift
//  BMUIDecorator
//
//  Created by LEE ZHE YU on 2019/6/23.
//

public class BMUIDecoratorStoresManager {
    public static var `default` = BMUIDecoratorStoresManager()
    private var storesMap = [String: BMUIDecoratorStore]()

    public func autoGenerate(storeName: String, decoratorCode: BMUIDecoratorCode) {
        let store = BMUIDecoratorStore(fileName: storeName)
        decoratorCode.installTo(store: store)
        storesMap[storeName] = store
        store.install()
    }

    public func getStore(_ name: String) -> BMUIDecoratorStore {
        guard let store = self.storesMap[name] else {
            print("BMUIDecoratorStoresManager ERROR: Can't get BMUIDecoratorStore for \(name)")
            return BMUIDecoratorStore(fileName: name)
        }
        return store
    }
}
