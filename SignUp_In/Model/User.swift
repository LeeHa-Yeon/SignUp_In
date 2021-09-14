
import UIKit

struct User {
    private var profile: UIImage?
    private var id: String
    private var password: String
    private var introduce: String
    private var phone: String
    private var birth: String
    
    init(id: String, password: String, introduce: String, profile: UIImage?, phone: String, birth: String){
        self.id = id
        self.password = password
        self.introduce = introduce
        self.phone = phone
        self.birth = birth
        self.profile = profile
    }
    
    func getId() -> String {
        return self.id
    }
    
    func getPassword() -> String {
        return self.password
    }
    
    func getIntroduce() -> String {
        return self.introduce
    }
    
    func getPhone() -> String {
        return self.phone
    }
    
    func getBirth() -> String {
        return self.birth
    }
    
    func getProfile() ->
    UIImage? {
        return self.profile
    }
    
    mutating func setId(_ id: String){
        self.id = id
    }
    
    mutating func setPassword(_ password: String){
        self.password = password
    }
    
    mutating func setIntroduce(_ introduce: String){
        self.introduce = introduce
    }
    
    mutating func setPhone(_ phone: String){
        self.phone = phone
    }
    
    mutating func setBirth(_ birth: String){
        self.birth = birth
    }
    
    mutating func setProfile(_ profile: UIImage?){
        self.profile = profile
    }
    
}
