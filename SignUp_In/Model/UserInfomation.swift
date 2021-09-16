import Foundation
import UIKit

class UserInfomation{
    static let shared: UserInfomation = UserInfomation()
    
    private init(){}
    
    var userInfo: User = User(id: "", password: "", introduce: "", profile: nil, phone: "", birth: "")
    
    func registUserId(id: String){
        userInfo.setId(id)
    }
    
    func registUserPwd(password: String){
        userInfo.setPassword(password)
    }
    
    func registUserProfile(profile: UIImage?){
        userInfo.setProfile(profile)
    }
    
    func registUserIntroduce(introduce: String){
        userInfo.setIntroduce(introduce)
    }
    
    func registUserPhone(phone: String){
        userInfo.setPhone(phone)
    }
    
    func registUserBirth(birth: String){
        userInfo.setBirth(birth)
    }
    
    func getUserId() -> String {
        return userInfo.getId()
    }
    
    func getUserPwd() -> String {
        return userInfo.getPassword()
    }
    
    
}
