import Foundation


class APIManager: ObservableObject{
    @Published var schools = [School]()
    
    func getSchoolData() {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            do {
                let schools = try JSONDecoder().decode([School].self, from: data)
                DispatchQueue.main.async {
                    self.schools = schools
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func filteredSchools(for searchText: String, in schools: [School]) -> [School] {
        if searchText.isEmpty {
            return schools
        } else {
            return schools.filter { $0.schoolName.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
