import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws -> String in
        do {
            // Attempt a simple query to verify database connectivity
            try await req.db.query(User.self).first()
            return "BlueFin server is running!"
        } catch {
            req.logger.error("Database health check failed: \(error)")
            throw Abort(.internalServerError, reason: "BlueFin had an error")
        }
    }

    app.get("hello") { req async -> String in
        "Hello, User!"
    }
}
