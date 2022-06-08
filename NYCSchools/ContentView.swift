//
//  ContentView.swift
//  NYCSchools
//
//  Created by Alexander Adgebenro on 6/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var schools = [School]()
    @State private var searchSchools = ""
    
    init(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .black
    }
    
    var body: some View {
       
            NavigationView {
                List(schools, id: \.self) { school in
                    NavigationLink(destination: SchoolsDetailView(school: school)) {
                        HStack {
                            VStack(alignment: .leading, spacing: 20){
                                Text("\(school.schoolName)")
                                    .searchable(text: $searchSchools)
                                    .font(.system(size: 17,weight: .regular, design: .serif))
                            }
                        }
                    } .listRowBackground(Color.clear)
                }
                .onAppear() {
                    apiCall().getSchoolData { (schools) in
                        self.schools = schools
                    }
                    
                }.navigationTitle("NYC High Schools")
                    .navigationBarTitleDisplayMode(.inline)
            }
       
    }

}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

