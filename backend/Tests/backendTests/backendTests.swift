@testable import backend
import VaporTesting
import Testing

@Suite("App Tests")
struct backendTests {
    @Test("Test Root Route")
    func root() async throws {
        try await withApp(configure: configure) { app in
            try await app.testing().test(.GET, "", afterResponse: { res async in
                // If the DB is not running during tests, we expect an error state.
                // Otherwise, we expect the success message.
                if res.status == .ok {
                    #expect(res.body.string == "BlueFin server is running!")
                } else {
                    #expect(res.status == .internalServerError)
                    // Vapor wraps Abort reasons in JSON by default.
                    #expect(res.body.string.contains("BlueFin had an error"))
                }
            })
        }
    }

    @Test("Test Hello World Route")
    func helloWorld() async throws {
        try await withApp(configure: configure) { app in
            try await app.testing().test(.GET, "hello", afterResponse: { res async in
                #expect(res.status == .ok)
                #expect(res.body.string == "Hello, world!")
            })
        }
    }
}
