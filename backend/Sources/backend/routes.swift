import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws -> String in
        req.logger.info("Health check requested")
        _ = try await req.db.query(User.self).first()
        return "BlueFin server is running!"
    }

    app.get("hello") { req async -> String in
        req.logger.debug("Successfully greeted a user.")
        return "Hello, User!"
    }

    app.get("test-error") { req async throws -> String in
        req.logger.info("A user is testing the error handler.")
        throw Abort(.badRequest, reason: "This is a custom error message.")
    }
}
