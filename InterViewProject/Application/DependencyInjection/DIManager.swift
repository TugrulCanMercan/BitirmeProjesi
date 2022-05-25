//
//  DIManager.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 19.04.2022.
//

import Foundation
import Swinject
import Infrastructure
import CoreData

final class DIManager{
    
    static let shared = DIManager()
    
    let container:Container
    
    
    private init(){
        self.container = Container()
        
        container.register(NetworkConfigurable.self, name: "IBaseApıConfig") { _ in
            let baseUrl = URL(string: "http://localhost:5001")!
            return ApiDataNetworkConfig(baseURL: baseUrl)
        }
        
        container.register(NetworkService.self, name: "INetworkService") { resolver in
            
            return DefaultNetworkService(config: resolver.resolve(NetworkConfigurable.self, name: "IBaseApıConfig")!)
        }
        container.register(DataTransferService.self, name: "IDataTransferService") { resolver in
            let dataTransferErrorLogger = DefaultDataTransferErrorLogger()
            //DataDefaultResolver Enumla değişcek
            let dataTransferErrorResolver = DefaultDataTransferErrorResolver()
            return DefaultDataTransferService(with: resolver.resolve(NetworkService.self, name: "INetworkService")!, errorResolver: dataTransferErrorResolver, errorLogger: dataTransferErrorLogger)
        }
        container.register(AuthRepositoryProtocol.self, name: "IAuthRepo") { resolver in
            return AuthRepository(networkService: resolver.resolve(DataTransferService.self, name: "IDataTransferService")!)
        }
        
        container.register(UserRepositoryProtocol.self, name: "IUserRepo") { resolver in
            return UserRepository(networkService: resolver.resolve(DataTransferService.self, name: "IDataTransferService")!)
        }
        
        container.register(LoginUseCase.self, name: "LoginUseCaseDI") { resolver in
            return LoginUseCase(authRepo: resolver.resolve(AuthRepositoryProtocol.self, name: "IAuthRepo")!)
        }
        
        container.register(GetUserUseCase.self, name: "GetUserUseCaseDI") { resolver in
            return GetUserUseCase(userRepo: resolver.resolve(UserRepositoryProtocol.self, name:"IUserRepo")!)
            
        }
        container.register(SignUpUseCase.self, name: "SignUpUseCaseDI") { resolver in
            return SignUpUseCase(authRepo: resolver.resolve(AuthRepositoryProtocol.self, name:"IAuthRepo")!)
            
        }
//        
//        container.register(NSPersistentContainer.self,name: "NSPersistentContainer") { resolver in
//            lazy var persistanceContainer:NSPersistentContainer = {
//                let container =  NSPersistentContainer(name: "ExamDraftContainer")
//                persistanceContainer.loadPersistentStores { description, err in
//                    print(err)
//                }
//                return container
//            }()
//            return persistanceContainer
//            
//            
//           
//        }
//        container.register(IExamDraftListRepository.self) { resolver in
//            let provider = CoreDataContextProvider { err in
//                print(err)
//            }
//
//            return ExamDraftListRepository(context: provider.viewContext)
//        }
//
//        container.register(ExamRepository.self) { resolver in
//            let provider = CoreDataContextProvider { err in
//                print(err)
//            }
//            return ExamRepository(context: provider.viewContext)
//        }
    }
    
    
    
    
}
