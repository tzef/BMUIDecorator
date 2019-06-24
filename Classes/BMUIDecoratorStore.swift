//
//  BMUIDecoratorStore.swift
//  BMUIDecorator
//
//  Created by LEE ZHE YU on 2019/6/23.
//

public class BMUIDecoratorStore {
    public var tagsInfo = [String: Any]()
    public var codeBase = [String: [DecoratorCodeClosure]]()

    private var fileName: String?
    public func install() {
        guard let fileName = fileName else {
            print("BMUIDecorator: no fileName")
            return
        }
        guard let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json") else {
            print("BMUIDecorator: json file not exist")
            return
        }
        let url = URL(fileURLWithPath: bundlePath)
        guard let data = try? Data(contentsOf: url) else {
            print("BMUIDecorator: load json data failed")
            return
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            json?.forEach({ (element) in
                tagsInfo[element.key] = element.value
            })
        } catch {
            print("BMUIDecorator: convert json data format failed \(error)")
        }
    }

    private init() {}
    convenience init(fileName: String) {
        self.init()
        self.fileName = fileName
    }

    public func getTagInfo(tag: BMUIDecoratorInfoName) -> [String: Any]? {
        return tagsInfo[tag.tagName()] as? [String: Any]
    }
    @discardableResult
    public func updateTagInfo(tag: BMUIDecoratorInfoName, info: [String: Any]) -> Bool {
        if self.getTagInfo(tag: tag) != nil {
            self.tagsInfo[tag.tagName()] = info
            return true
        } else {
            return false
        }
    }
}
