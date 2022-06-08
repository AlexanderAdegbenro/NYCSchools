//
//  SchoolsDetailView.swift
//  NYCSchools
//
//  Created by Alexander Adgebenro on 6/7/22.
//

import SwiftUI

struct SchoolsDetailView: View {
    
    var school: School
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.521484168179064, saturation: 1.0, brightness: 0.8, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.5302666813494211, saturation: 0.04918301823627518, brightness: 0.922654255326972, opacity: 1.0), location: 0.7245633638822117)]), startPoint: UnitPoint.bottomTrailing, endPoint: UnitPoint.topLeading)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Spacer()
                Spacer()
                VStack(alignment: .leading, spacing: 2) {
                    Text(school.schoolName)
                        .font(.system(size: 20,weight: .bold, design: .serif))
                        .foregroundColor(.black)
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 2)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                VStack(alignment: .leading, spacing: 20) {
                    Text("Sat Math Average Score: \(school.satMathAvgScore)")
                        .font(.system(size: 20,weight: .regular, design: .serif))
                                        Text("Sat Writing Avg Score: \(school.satWritingAvgScore)")
                        .font(.system(size: 20,weight: .regular, design: .serif))
                    Text(" Number of test takers: \(school.numOfSatTestTakers)")
                        .font(.system(size: 20,weight: .regular, design: .serif))
                    Text(" Sat Reading Score Average: \(school.satCriticalReadingAvgScore)")
                        .font(.system(size: 20,weight: .regular, design: .serif))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Spacer()
            }
            .padding()
        }
    }
}
