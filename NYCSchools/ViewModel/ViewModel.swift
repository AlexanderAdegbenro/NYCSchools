//
//  ViewModel.swift
//  NYCSchools
//
//  Created by Alexander Adgebenro on 6/7/22.
//

import Foundation

class apiCall {
    func getSchoolData(completion:@escaping ([School]) -> ()) {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let schools = try! JSONDecoder().decode([School].self, from: data!)
            
            DispatchQueue.main.async {
                completion(schools)
            }
        }
        .resume()
    }
}
