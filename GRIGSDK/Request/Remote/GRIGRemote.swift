import Foundation
import Apollo

final class GRIGRemote {
    //MARK: - Properties
    static let shared = GRIGRemote()
    
    private let client = ApolloClient(url: URL(string: "https://d6ui2fy5uj.execute-api.ap-northeast-2.amazonaws.com/api/graphql")!)
    
    func fetchRankingList(
        criteria: Criteria,
        count: Int,
        page: Int,
        generation: Int,
        completion: @escaping (Result<[GRIGAPI.GrigEntityQuery.Data.Ranking?], Error>) -> Void
    ) {
        client.fetch(query: GRIGAPI.GrigEntityQuery(
            criteria: criteria.rawValue, count: count, page: page, generation: generation)
        ) { res in
            switch res {
            case let .success(data):
                completion(.success(data.data?.ranking ?? [] ))
            case let .failure(err):
                completion(.failure(err))
            }
        }
    }
    
    func fetchGenerationList(completion: @escaping  (Result<[GRIGAPI.GrigGenerationQuery.Data.Generation?], Error>) -> Void) {
        client.fetch(query: GRIGAPI.GrigGenerationQuery()) { res in
            switch res {
            case let .success(data):
                completion(.success(data.data?.generation ?? []))
            case let .failure(err):
                completion(.failure(err))
            }
        }
    }
}
