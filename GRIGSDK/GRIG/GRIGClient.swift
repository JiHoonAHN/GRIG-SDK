import Foundation

public final class GRIG {
    //MARK: - Properties
    static let get_instance = GRIG()
    
    private let grigRemote = GRIGRemote()
    private let githubRemote = GithubRemote()
}

//MARK: - GithubRemote
extension GRIG {
    func githubUserInfo(
        login: String,
        from: String,
        to: String,
        completion: @escaping (Result<GRIGAPI.GithubUserQuery.Data.User?, Error>) -> Void
    ) {
        githubRemote.fetchUserInfo(login: login, from: from, to: to, completion: completion)
    }
    
    func githubUserTotalContribution(
        login: String,
        completion: @escaping (Result<Int?,Error>) -> Void
    ) {
        githubRemote.fetchUserTotalContribution(login: login, completion: completion)
    }
}

//MARK: - GRIGRemote
extension GRIG {
    func grigRankList(
        criteria: Criteria,
        count: Int,
        page: Int,
        generation: Int,
        completion: @escaping (Result<[GRIGAPI.GrigEntityQuery.Data.Ranking?], Error>) -> Void
    ) {
        grigRemote.fetchRankingList(criteria: criteria, count: count, page: page, generation: generation, completion: completion)
    }
    
    func grigGenerationList(completion: @escaping  (Result<[GRIGAPI.GrigGenerationQuery.Data.Generation?], Error>) -> Void) {
        grigRemote.fetchGenerationList(completion: completion)
    }
}

