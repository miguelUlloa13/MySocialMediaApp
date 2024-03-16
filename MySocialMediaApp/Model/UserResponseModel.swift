//
//  UserResponseModel.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 08/03/24.
//

import Foundation

/// Struct response to API
struct UserResponseModel: Decodable {
    let results: [UserDataModel]
}

/*
 {
    "results":[
       {
          "gender":"male",
          "name":{
             "title":"Monsieur",
             "first":"Sandro",
             "last":"Gerard"
          },
          "location":{
             "street":{
                "number":8247,
                "name":"Rue Louis-Garrand"
             },
             "city":"Jorat-Mézières",
             "state":"Valais",
             "country":"Switzerland",
             "postcode":5978,
             "coordinates":{
                "latitude":"-62.7633",
                "longitude":"-57.5148"
             },
             "timezone":{
                "offset":"-10:00",
                "description":"Hawaii"
             }
          },
          "email":"sandro.gerard@example.com",
          "login":{
             "uuid":"d61de6de-e056-4717-a033-69628d890b8f",
             "username":"blueduck490",
             "password":"456789",
             "salt":"4auyDhEi",
             "md5":"b821eb18e74818311886d237a52a5073",
             "sha1":"aa0a3b6b622fab546b40a0d3cdb4c8d217cd6ad4",
             "sha256":"8b3825041df6067fa87075049a81bb0a0569ccae2c3008a5a4aecf06085fff7c"
          },
          "dob":{
             "date":"1977-05-17T22:29:54.831Z",
             "age":46
          },
          "registered":{
             "date":"2010-02-15T18:52:52.968Z",
             "age":14
          },
          "phone":"079 550 75 98",
          "cell":"077 762 53 98",
          "id":{
             "name":"AVS",
             "value":"756.0484.7533.76"
          },
          "picture":{
             "large":"https://randomuser.me/api/portraits/men/12.jpg",
             "medium":"https://randomuser.me/api/portraits/med/men/12.jpg",
             "thumbnail":"https://randomuser.me/api/portraits/thumb/men/12.jpg"
          },
          "nat":"CH"
       }
    ],
    "info":{
       "seed":"f8373758b7ad6d73",
       "results":1,
       "page":1,
       "version":"1.4"
    }
 }
 */
