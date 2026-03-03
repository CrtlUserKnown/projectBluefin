import Vapor

struct ErrorResponse: Content {
    let error: Bool
    let reason: String
}

struct BluefinErrorMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: any AsyncResponder) async throws -> Response {
        do {
            return try await next.respond(to: request)
        } catch {
            let status: HTTPResponseStatus
            let reason: String

            if let abort = error as? any AbortError {
                status = abort.status
                reason = abort.reason
            } else {
                status = .internalServerError
                reason = "An unexpected error occurred."

                request.logger.report(error: error)
            }

            let response = Response(status: status)
            try response.content.encode(ErrorResponse(error: true, reason: reason))
            return response
        }
    }
}
