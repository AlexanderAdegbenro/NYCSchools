import Foundation

class SchoolsDetailViewModel: ObservableObject {
    let school: School
    
    init(school: School) {
        self.school = school
    }
    
    var schoolName: String {
        school.schoolName
    }
    
    var satMathAvgScore: String {
        school.satMathAvgScore
    }
    
    var satCriticalReadingAvgScore: String {
        school.satCriticalReadingAvgScore
    }
    
    var satWritingAvgScore: String {
        school.satWritingAvgScore
    }
    
    var numOfSatTestTakers: String {
        school.numOfSatTestTakers
    }
}

