//
//  Copyright 2023 Eigo Madaloja
//

public protocol ProductService {
    associatedtype Product

    func loadProduct(withID productID: String, completion: @escaping (Result<Product, ProductLoadingError>) -> Void)
}

public enum ProductLoadingError: Error {
    case productNotFound
    case error(Error)
}
