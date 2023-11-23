class AuthRequestBuilder: AuthRequestBuilderProtocol {

    var authEndpoint: String
    var authParams: [String: [String : Any]]

    public init(authEndpoint: String, authParams: [String: [String : Any]]) {
        self.authEndpoint = authEndpoint
        self.authParams = authParams
    }

    func requestFor(socketID: String, channelName: String) -> URLRequest? {
        var request = URLRequest(url: URL(string: "http://localhost:9292/builder")!)
        request.httpMethod = "POST"
        request.httpBody = "socket_id=\(socketID)&channel_name=\(channel.name)".data(using: String.Encoding.utf8)
        request.addValue(authParams["headers"]["Authorization"], forHTTPHeaderField: "Authorization")
        return request
    }
}


