@testable import backend
import Testing
import Foundation

@Suite("Model Tests")
struct ModelTests {
    @Test("Test User Model Initialization")
    func testUserInitialization() {
        let userID = UUID()
        let user = User(id: userID, username: "testuser", email: "test@example.com")
        
        #expect(user.id == userID)
        #expect(user.username == "testuser")
        #expect(user.email == "test@example.com")
    }

    @Test("Test Camper Model Initialization")
    func testCamperInitialization() {
        let dob = Date(timeIntervalSince1970: 1420070400) // 2015-01-01
        let camper = Camper()
        camper.firstName = "John"
        camper.lastName = "Doe"
        camper.dateOfBirth = dob
        camper.guardianName = "Jane Doe"
        camper.guardianPhone = "555-0199"
        
        #expect(camper.firstName == "John")
        #expect(camper.lastName == "Doe")
        #expect(camper.dateOfBirth == dob)
        #expect(camper.guardianName == "Jane Doe")
        #expect(camper.guardianPhone == "555-0199")
    }
}
