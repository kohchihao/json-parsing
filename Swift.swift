import Foundation

struct jsonResponse: Decodable {
    let base: String
    let date: String
    let rates: [String: Float]
}

// Using semaphore just to prevent command line tool from exiting before asynchronous operation
let semaphore = DispatchSemaphore( value: 0)

func handleJson(success: @escaping (_ result: String) -> Void) {
    let urlString = "https://api.fixer.io/latest?symbols=MYR&base=SGD"
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, err) in
        guard let data = data else { return }
        do {
            let latest = try JSONDecoder().decode(jsonResponse.self, from: data)
            
            let key = latest.rates.keys.first!
            let value = latest.rates[key]!
            
            let result = String(format: "%@1 = %@%.1f", latest.base, key, value)
            success(result)
            
            semaphore.signal()
        } catch let jsonErr {
            print("Error serializing:", jsonErr)
        }
        }.resume()
}

handleJson(success: { result in
    print(result)
})

let timeout = DispatchTime.now() + .seconds(15)
_ = semaphore.wait(timeout: timeout)
