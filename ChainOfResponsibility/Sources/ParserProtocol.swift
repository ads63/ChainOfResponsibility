//
//  ParserProtocol.swift
//  ChainOfResponsibility
//
//  Created by Алексей Шинкарев on 31.03.2022.
//

import Foundation

protocol ParserProtocol {
    var next: ParserProtocol? { get set }
    func parse(data: Data) -> [Person]?
}
