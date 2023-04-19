import SwiftUI

struct ContentView: View {
    
    //This creates an instance of APIManager, which is an observable object that handles the API calls to retrieve the school data.
    @ObservedObject var apiManager = APIManager()
    
    @State private var searchSchools = ""
    
    //This creates a Boolean variable that tracks whether the user is currently editing the search ba
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            VStack {
               
                //This displays the search bar and passes the search string and editing status to the SearchBar view.
                SearchBar(text: $searchSchools, isEditing: $isEditing)
                    .padding()
                
                //This checks if the schools array in the apiManager object is empty, and displays a progress view if it is.
                if apiManager.schools.isEmpty {
                    ProgressView()
                        .padding()
                } else {
                    
                    //This creates a filtered list of schools based on the search string and the schools retrieved from the AP
                    let filteredSchools = apiManager.filteredSchools(for: searchSchools, in: apiManager.schools)
                    
                    List(filteredSchools) { school in
                        //This creates a navigation link that leads to the detail view for a specific school.
                        NavigationLink(destination: SchoolsDetailView(viewModel: SchoolsDetailViewModel(school: school))) {
                            SchoolRowView(school: school)
                        }
                        .listRowBackground(Color.clear)
                    }
                }
            }
            .navigationTitle("NYC Schools")
        }
        .onAppear {
            apiManager.getSchoolData()
        }.background(
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: .init(hue: 0.521484168179064, saturation: 1.0, brightness: 0.8), location: 0),
                    .init(color: .init(hue: 0.5302666813494211, saturation: 0.04918301823627518, brightness: 0.922654255326972), location: 0.7245633638822117)
                ]),
                startPoint: .bottomTrailing,
                endPoint: .topLeading
            )
            .ignoresSafeArea())
        .onAppear {
            setupNavigationBarAppearance()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



private func setupNavigationBarAppearance() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = .white
    appearance.titleTextAttributes = [.font: UIFont(name: "Avenir", size: 16)!, .foregroundColor: UIColor.black]
    appearance.largeTitleTextAttributes = [.font: UIFont(name: "Avenir", size: 34)!, .foregroundColor: UIColor.blue]
    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().compactAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
    UINavigationBar.appearance().tintColor = .blue
}
//This creates a view that displays the school name, SAT scores, and number of test takers for a specific school.
struct SchoolRowView: View {
    let school: School
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(school.schoolName)
                    .font(.custom("Avenir-Medium", size: 17))
                HStack {
                    //This displays a star icon
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .padding(.trailing, 4)
                    Text("\(school.satMathAvgScore)")
                        .font(.custom("Avenir", size: 14))
                }
            }
            Spacer()
            Text("\(school.numOfSatTestTakers)")
                .font(.custom("Avenir", size: 14))
                .padding(.trailing, 8)
        }
        .padding(.vertical, 8)
    }
}
//This creates a custom search bar view with a text field and a cancel button.
struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            TextField(" Search for schools", text: $text)
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 8)
                .onTapGesture {
                    isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    isEditing = false
                    text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                        .padding(.horizontal, 8)
                }
            }
            
        }
    }
}
