enum APIError: Error {
    case URLError
    case dataTaskError(error: Error)
    case dataNotFound
    case decoderError(error: Error)
}

