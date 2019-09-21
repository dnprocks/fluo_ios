//
//  TaskRepository.swift
//  TodoList
//
//  Created by Daniel Pimentel on 13/08/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation

class TaskRepository {
    
    private let taskApi: TaskApi
    private let userRepository: UserRepository
    
    private init(_ taskApi: TaskApi){
//  private init(taskApi: TaskApi){
        self.taskApi = taskApi
        self.userRepository = UserRepository.factory()
    }
    
    func getTasksByProject(_ idProject: String, callback:@escaping(Array<TaskResponse>?, Bool) -> Void) {
        
        if let token = userRepository.getToken(){
            taskApi.getTaskByProject(idProject: idProject, token: token){(result) in
                switch result {
                case .success(let tasks):
                    callback(tasks, true)
                case .failure( _):
                    callback(nil, false)
                }
            }
            
        }
        
    }
    
    
    func addNewTask(task: TaskResponse, completion: @escaping (Bool) -> Void) {
        if let token = userRepository.getToken(){
            taskApi.addNewTask(task: task, token: token){(result) in
                switch result {
                case .success:
                    print("Aqui - TaskRepository")
                    completion(true)
                case .failure:
                    completion(false)
                }
            }
        }
    }
    
    func getTasks(callback:@escaping(Array<TaskResponse>?, Bool) -> Void) {
        
        if let token = userRepository.getToken(){
            taskApi.getTasks(token: token){(result) in
                switch result {
                case .success(let tasks):
                    callback(tasks, false)
                case .failure( _):
                    callback(nil, false)
                }
            }
            
        }
        
    }
        
    static func factory() -> TaskRepository{
        let network = NetworkManager()
        let api = TaskApi(network: network)
//        return TaskRepository(taskApi: api)
        return TaskRepository(api)
    }
   
}
