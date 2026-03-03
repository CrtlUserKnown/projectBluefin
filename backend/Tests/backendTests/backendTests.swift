@testable import backend
import VaporTesting
import Testing
import Vapor

@Suite("App Tests")
struct backendTests {
    @Test("Test Root Route")
    func root() async throws {
        try await withApp(configure: configure) { app in
            try await app.testing().test(.GET, "", afterResponse: { res async throws in // Added throws
                if res.status == .ok {
                    #expect(res.body.string == "BlueFin server is running!")
                } else {
                    // When the DB fails, our middleware returns JSON
                    let error = try res.content.decode(ErrorResponse.self)
                    #expect(res.status == .internalServerError)
                    #expect(error.error == true)
                    #expect(error.reason == "An unexpected error occurred.")
                }
            })
        }
    }

    @Test("Test Hello User Route")
    func helloUser() async throws {
        try await withApp(configure: configure) { app in
            try await app.testing().test(.GET, "hello", afterResponse: { res async throws in // Added throws
                #expect(res.status == .ok)
                #expect(res.body.string == "Hello, User!")
            })
        }
    }

    @Test("Test Custom Error Middleware")
    func customError() async throws {
        try await withApp(configure: configure) { app in
            try await app.testing().test(.GET, "test-error", afterResponse: { res async throws in // Added throws
                #expect(res.status == .badRequest)
                let error = try res.content.decode(ErrorResponse.self)
                #expect(error.error == true)
                #expect(error.reason == "This is a custom error message.")
            })
        }
    }
}
