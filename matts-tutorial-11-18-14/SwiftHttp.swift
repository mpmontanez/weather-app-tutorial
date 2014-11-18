
import Foundation

class SwiftHttp {

    // Performs an HTTP request.
    func HTTPsendRequest(request: NSMutableURLRequest, callback: (String, String?) -> Void) {
        // Shared session and tasks.
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            // Handle errors.
            if (error != nil) {
                callback("", error.localizedDescription)
            }
            // Execute callback with received HTTP response data.
            else {
                callback(NSString(data: data, encoding: NSUTF8StringEncoding)!, nil)
            }
        }
        
        task.resume()
    }
    
    // Performs an HTTP GET request.
    func HTTPGet(url: String, callback: (String, String?) -> Void) {
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        HTTPsendRequest(request, callback)
    }
}
