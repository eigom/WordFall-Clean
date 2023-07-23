//
//  Copyright 2023 Eigo Madaloja
//

public protocol PurchaseRestoringService {
    func restorePurchases(completion: @escaping (Result<Void, Error>) -> Void)
}
