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
    
    func fetchUserInfo(
        login: String,
        from: String,
        to: String,
        completion: @escaping (Result<GRIGAPI.GithubUserQuery.Data.User?, Error>) -> Void
    )  {
        client.fetch(
            query: GRIGAPI.GithubUserQuery(
                login: login,
                from: from,
                to: to
            )
        ) { res in
            switch res {
            case let .success(data):
                Log.network("User Info Success", data)
                completion(.success(data.data?.user ?? nil))
            case let .failure(err):
                Log.error("User Info Fail : \(err.localizedDescription)", err)
                completion(.failure(err))
            }
        }
    }
    
    func fetchUserTotalContribution(
        login: String,
        completion: @escaping (Result<Int?,Error>) -> Void
    ) {
        client.fetch(query: GRIGAPI.TotalContributionQuery(login: login)) { res in
            switch res {
            case let .success(data):
                Log.network("User Total Contribution Success", data)
                completion(.success(data.data?.user?.contributionsCollection.contributionCalendar.totalContributions ?? nil))
            case let .failure(err):
                Log.error("User Total Contribution Fail : \(err.localizedDescription)", err)
                completion(.failure(err))
            }
        }
    }
}
