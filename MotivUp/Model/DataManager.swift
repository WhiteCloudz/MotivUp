//
//  DataManager.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//


import CoreData
import Foundation
import UIKit

class DataManager {
    
    let userID = "userOfMotivUp"
    
    static let shared = DataManager()
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "MotivUp")
        
        let storeURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.motivupgroup")!.appendingPathComponent("MotivUp.sqlite")
        let description = NSPersistentStoreDescription(url: storeURL)
        persistentContainer.persistentStoreDescriptions = [description]
        
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print("Persistent store loading error: \(error)")
            }
        }
    }
    
    
    func startApp() -> Bool {
        let context = persistentContainer.viewContext
        
        do {
            let newData = MotivUpData(context: context)
            newData.userIDs = "userOfMotivUp"
            
            try context.save()
            return true
        } catch {
            print("Data not saved")
            return false
        }
    }
    
    

    func createOrUpdateLikeData(motivationID: String? = nil, likeSentences: String? = nil) -> Bool {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<LikeData> = LikeData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "motivationID == %@", motivationID ?? "")
        
        do {
            let existingData = try context.fetch(fetchRequest)
            
            if let dataMotivUP = existingData.first {
                if let likeSentences = likeSentences {
                    if let existingSentences = dataMotivUP.likeSentences {
                        let sentencesArray = existingSentences.components(separatedBy: ",")
                        if !sentencesArray.contains(likeSentences) {
                            dataMotivUP.likeSentences = existingSentences + "," + likeSentences
                        }
                    } else {
                        dataMotivUP.likeSentences = likeSentences
                    }
                }
            } else {
                let newData = LikeData(context: context)
                newData.motivationID = motivationID
                newData.likeSentences = likeSentences
            }
            
            try context.save()
            return true
        } catch {
            print("Data not saved")
            return false
        }
    }
    
    
    func createOrUpdateMotivationData(name: String? = nil, category: String? = nil, backgroundImageName: String? = nil) -> Bool {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<MotivUpData> = MotivUpData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userIDs == %@", userID )
        
        do {
            let existingData = try context.fetch(fetchRequest)
            let dataMotivUP: MotivUpData
            
            if let existingData = existingData.first {
                dataMotivUP = existingData
            } else {
                dataMotivUP = MotivUpData(context: context)
                dataMotivUP.userIDs = userID
            }
            
            if let name = name {
                dataMotivUP.name = name
            }
            
            if let category = category {
                dataMotivUP.category = category
            }
            
            if let backgroundImageName = backgroundImageName {
                dataMotivUP.backgroundImageName = backgroundImageName
            }

            try context.save()
            return true
        } catch {
            print("Motivasyon verisi çekme veya kaydetme başarısız oldu: \(error)")
            return false
        }
    }
    
    
    func fetchMotivationData() -> [MotivUpData]? {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<MotivUpData> = MotivUpData.fetchRequest()
        
        do {
            let results = try context.fetch(fetchRequest)
            return results
        } catch {
            print("Fetch failed: \(error)")
            return nil
        }
    }
    
    
    func fetchLikeData() -> [LikeData]? {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<LikeData> = LikeData.fetchRequest()
        
        do {
            let results = try context.fetch(fetchRequest)
            return results
        } catch {
            print("Fetch failed: \(error)")
            return nil
        }
    }

    
    
    func deleteLikeData(motivationID: String? = nil, likeSentences: String? = nil) -> Bool {
         let context = persistentContainer.viewContext
         let fetchRequest: NSFetchRequest<LikeData> = LikeData.fetchRequest()
         var predicates = [NSPredicate]()
        
         if let dataID = motivationID {
             predicates.append(NSPredicate(format: "motivationID == %@", dataID))
         }
        
         if let likeSentences = likeSentences {
             predicates.append(NSPredicate(format: "likeSentences == %@", likeSentences))
         }
         
         if predicates.isEmpty {
             return false
         }
         
         fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
         
         do {
             let matchingItems = try context.fetch(fetchRequest)
             for item in matchingItems {
                 context.delete(item)
             }
             try context.save()
             return true
         } catch {
             print("Error deleting items: \(error)")
             return false
         }
     }
  
    
    
    func deleteMotivationData(forUserID userID: String) -> Bool {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<MotivUpData> = MotivUpData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userIDs == %@", userID)
        
        do {
            let matchingItems = try context.fetch(fetchRequest)
            for item in matchingItems {
                context.delete(item)
            }
            try context.save()
            return true
        } catch {
            print("Error: \(error)")
            return false
        }
    }
    
    
    func deleteLikedAllData(){
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<LikeData> = LikeData.fetchRequest()
        do {
            let matchingItems = try context.fetch(fetchRequest)
            for item in matchingItems {
                context.delete(item)
            }
            try context.save()
        } catch {
            print("Error: \(error)")
        }
        
    }
    
    
    func isMotivationIDRegistered(motivationID: String) -> Bool {
           let context = persistentContainer.viewContext
           let fetchRequest: NSFetchRequest<LikeData> = LikeData.fetchRequest()
           fetchRequest.predicate = NSPredicate(format: "motivationID == %@", motivationID)
           
           do {
               let result = try context.fetch(fetchRequest)
               return !result.isEmpty
           } catch {
               print("Error checking if motivation ID is registered: \(error)")
               return false
           }
       }
   }
    

