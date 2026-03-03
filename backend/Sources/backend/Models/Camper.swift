import Fluent
import Vapor

final class Camper: Model, Content, @unchecked Sendable {
    static let schema = "campers"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "first_name")
    var firstName: String

    @Field(key: "last_name")
    var lastName: String

    @Field(key: "date_of_birth")
    var dateOfBirth: Date

    @Field(key: "guardian_name")
    var guardianName: String

    @Field(key: "GuardianPhone")
    var guardianPhone: String

    init() { }

    init(id: UUID? = nil, firstName: String, lastName: String, dateOfBirth: Date, guardianName: String, guardianPhone: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.guardianName = guardianName
        self.guardianPhone = guardianPhone
    }
}
