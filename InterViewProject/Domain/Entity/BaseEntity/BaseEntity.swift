//
//  BaseEntity.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 7.06.2022.
//

import Foundation


struct BaseEntity<T> {
    let responseMessage:String
    let data:T
    let responseStatus:String
}
