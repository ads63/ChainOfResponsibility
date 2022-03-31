//
//  ViewController.swift
//  ChainOfResponsibility
//
//  Created by Алексей Шинкарев on 31.03.2022.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var dataArray = [Data]()
        dataArray.append(data(from: "1")) // 1.json
        dataArray.append(data(from: "2")) // 2.json
        dataArray.append(data(from: "3")) // 3.json

        for data in dataArray {
            if let persons = parseData(data: data) {
                let personsString = persons
                    .map { "{" + $0.name + " " + $0.age.description
                        + " " + $0.isDeveloper.description + "}"
                    }.joined(separator: ",")
                print("[" + personsString + "]")
            }
        }

        // Do any additional setup after loading the view.
    }

    private func data(from file: String) -> Data {
        let path1 = Bundle.main.path(forResource: file, ofType: "json")!
        let url = URL(fileURLWithPath: path1)
        let data = try! Data(contentsOf: url)
        return data
    }

    private func parseData(data: Data) -> [Person]? {
        let parser1 = DataParser<ResponseData>()
        let parser2 = DataParser<ResponseResult>()
        let parser3 = DataParser<Response>()
        parser1.next = parser2
        parser2.next = parser3
        return parser1.parse(data: data)
    }
}
