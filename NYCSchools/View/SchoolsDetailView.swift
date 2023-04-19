
import SwiftUI

struct SchoolsDetailView: View {
    
    @ObservedObject var viewModel: SchoolsDetailViewModel
    
    private let gradientStops = [
        Gradient.Stop(color: Color(hue: 0.721, saturation: 1.0, brightness: 0.8), location: 0),
        Gradient.Stop(color: Color(hue: 0.730, saturation: 0.049, brightness: 0.922), location: 0.725)
    ]
    
    private let backgroundColor = Color(UIColor.systemBackground)
    private let textColor = Color.black
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: gradientStops),
                           startPoint: .bottomTrailing,
                           endPoint: .topLeading)
            .ignoresSafeArea()
            
            
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(viewModel.schoolName)
                        .font(.system(size: 20, weight: .bold, design: .serif))
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                }
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground))
                .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("SAT Scores")
                        .font(.system(size: 24, weight: .bold, design: .serif))
                        .foregroundColor(.black)
                    
                    HStack(alignment: .top, spacing: 20) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Math")
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .foregroundColor(.black)
                            Text(viewModel.satMathAvgScore)
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(.black)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Reading")
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .foregroundColor(.black)
                            Text(viewModel.satCriticalReadingAvgScore)
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(.black)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Writing")
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .foregroundColor(.black)
                            Text(viewModel.satWritingAvgScore)
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(.black)
                        }
                    }
                    
                    Text("Number of Test Takers: \(viewModel.numOfSatTestTakers)")
                        .font(.system(size: 20, weight: .regular, design: .serif))
                        .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .padding(.vertical, 20)
                
                Spacer()
            }
            .padding()
        }
        
    }
}
