//
//  ConstProvider.swift
//  SwiftyConst
//
//  Created by Junnosuke Matsumoto on 2021/01/31.
//

import Foundation
import Yams

protocol ConstProvider {
    func value(for key: String) -> String?
}

class EnvironmentValueProvider: ConstProvider {
    func value(for key: String) -> String? {
        ProcessInfo.processInfo.environment[key]
    }
}

class YamlValueProvider: ConstProvider {

    let values: [String: String]

    init(contentsOf url: URL) throws {
        self.values = try YAMLDecoder().decode(from: Data(contentsOf: url))
    }

    func value(for key: String) -> String? {
        values[key]
    }
}
