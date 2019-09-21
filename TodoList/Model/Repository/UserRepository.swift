//
//  UserRepository.swift
//  TodoList
//
//  Created by Felipe Arimateia on 01/07/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation

class UserRepository {
    
    private let userApi: UserApi
    
    private init(userApi: UserApi) {
        self.userApi = userApi
    }
    
    func cadastro(name: String,email: String, password: String, callback: @escaping (Bool) -> Void) {
        userApi.cadastro(name: name, email: email, password: password) { (result) in
            switch result {
            case .success(let user):
//                self.saveToken(token: user.token)
                print(user)
                callback(true)
            case .failure(let error):
                
//                print(error)
                print(error.localizedDescription)
                callback(false)
                
            }
        }
    
    }
    
    func login(email: String, password: String, callback: @escaping (Bool) -> Void) {
        userApi.login(email: email, password: password) { (result) in
            switch result {
            case .success(let user):
                self.saveToken(token: user.token)
                self.saveUserId(userId: user.id)
                print(user)
                callback(true)
            case .failure(let error):
                
                print(error.localizedDescription)
                callback(false)
                
            }
        }
    }
    
    func me() {
        if let token = getToken() {
            userApi.me(token: token) { (result) in
                switch result {
                case .success(let user):
                    print(user)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func saveToken(token: String) {
        UserDefaults.standard.set(token, forKey: "token")
    }
    
    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: "token")
    }
    
    private func saveUserId(userId: String) {
        UserDefaults.standard.set(userId, forKey: "userId")
    }
    
    func getUserId() -> String? {
        return UserDefaults.standard.string(forKey: "userId")
    }
    
    static func factory() -> UserRepository {
        let network = NetworkManager()
        let api = UserApi(network: network)
        return UserRepository(userApi: api)
    }
}
