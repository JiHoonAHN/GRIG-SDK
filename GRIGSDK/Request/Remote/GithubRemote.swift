import Foundation
import Apollo

final class GithubRemote {
    //MARK: - Properties
    static let shared = GithubRemote()

    private let client: ApolloClient = {
        let url = URL(string: "https://api.github.com/graphql")!
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Authorization": "bearer \(ProcessInfo.processInfo.environment["GITHUB"] ?? "")"]
        let session = URLSessionClient(sessionConfiguration: config, callbackQueue: nil)
        let networkProvider = NetworkInterceptorProvider(store: store, client: session)
        let transport = RequestChainNetworkTransport(interceptorProvider: networkProvider, endpointURL: url)
        return ApolloClient(networkTransport: transport, store: store)
    }()
    
    func fetchRankList() {
        
    }
    
    func fetchGenerationList() {
        
    }
}
