//
//  ModelData.swift
//  Landmarks
//
//  Created by Sierra on 2023/03/26.
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("파일명 : \(filename)을 main bundle에서 찾을 수 없습니다")
    }
    
    do{
        data = try Data(contentsOf: file)
    } catch{
        fatalError("파일명 : \(filename)을 main bundle에서 로드할 수 없습니다")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError("\(filename)를 \(T.self)로 파싱할 수 없습니다")
    }
}
