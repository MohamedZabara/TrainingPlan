//
//  TrainingPlan.swift
//  TrainingPlan
//
//  Created by Mohamed Zabara on 04/04/2022.
//

import Foundation
class TrainingPlan{
    let startDate:String
    let raceDate:String
    
    var index:Int = 0
    var numberOfWeeks = 0
    var totalDays:Int = 0
    var firstDay = 0
    var firstMonth = 0
    
    var startDay:Int{
        let startDateArr = startDate.split(separator: "-")
        guard let startDay = Int(startDateArr[Constant.indexDay])else{
            return 0
        }
        firstDay = startDay
        return startDay
    }
    
    var startMonth:Int{
        let startDateArr = startDate.split(separator: "-")
        guard let startMonth = Int(startDateArr[Constant.indexMonth])else{
            return 0
        }
        firstMonth = startMonth
        return startMonth
    }
    
    
    init(startDate:String,raceDate:String){
        self.startDate = startDate
        self.raceDate=raceDate
    }
    
    func viewTrainingPlan(){
        getNumberOfWeeks()
    }
    //MARK: - Get Total number of weeks
    func getNumberOfWeeks(){
        let startDateArr = startDate.split(separator: "-")
        let raceDateArr = raceDate.split(separator: "-")
        guard let raceMonth = Int(raceDateArr[Constant.indexMonth]),let raceDay = Int(raceDateArr[Constant.indexDay]) else{
            return
        }
        if startDateArr.first == raceDateArr.first && (startMonth < raceMonth)  && startMonth>=1 && startMonth<=12 && raceMonth>=1 && raceMonth<=12  {
            totalDays = totalDays+Constant.daysPerMonth[startMonth-1] - startDay
            
            for i in startMonth+1 ..< raceMonth{
                totalDays+=Constant.daysPerMonth[i-1]
            }
            
            totalDays = totalDays+Constant.daysPerMonth[raceMonth-1] - raceDay
            
            numberOfWeeks = totalDays/7
            do{
                try checkNumberOfWeeks(numberOfWeeks: numberOfWeeks)
            }catch ErrorTypes.runtimeError(let errorMessage) {
                print(errorMessage)
                return
            }catch{
                print("error")
                return
            }
            
        }else{
            print("Invalid date ")
            return
        }
        
    }
    //MARK: - Switch on numberOfWeeks
    func checkNumberOfWeeks(numberOfWeeks:Int)throws{
        if numberOfWeeks < Constant.minWeek{
            throw ErrorTypes.runtimeError("Minimum week is less than 8")
        }else{
            switch numberOfWeeks%Constant.minWeek{
            case 1,5 :
                //case (8weeks)+1
                printPlan(planTypeIndex:0,startLoopAt: 3)
                break
            case 2,6 :
                //case (8weeks)+2
                printPlan(planTypeIndex:2,startLoopAt: 2)
                break
            case 3,7 :
                //case (8weeks)+3
                printPlan(planTypeIndex:1,startLoopAt: 2)
                break
            default:
                //case exactly 8weeks
                printPlan(planTypeIndex:0,startLoopAt: 2)
                break
            }
        }
    }
    
    
    //MARK: - Print Plan
    func printPlan(planTypeIndex:Int,startLoopAt startLoop:Int){
        
        index = planTypeIndex
        printLineDetails(with: "Test",week:1)
        printLineDetails(with: "Test",week:2)
        if startLoop == 3{
            printLineDetails(with: "Filler",week:3)
        }
        
        for i in startLoop...numberOfWeeks-3{
            
            printLineDetails(with: Constant.trainingPlanType[index],week:i+1)
            
            index+=1
            if index == 4{
                if numberOfWeeks-3 != i{
                    index = 0
                }
            }
        }
        printLineDetails(with: "Taper",week:numberOfWeeks-1)
        printLineDetails(with: "Race",week:numberOfWeeks)
    }
    
    //MARK: - Details of plan on each line
    func printLineDetails(with planType:String,week:Int){
        
        let dateTuple = dateOfPlan()
        
        print("Week #\(week) - \(planType) - " + "from \(firstDay) \(Month(rawValue: firstMonth) ?? .Jan) " + "To \(dateTuple.toDay) \(Month(rawValue: dateTuple.toMonth) ?? .Jan)" )
        if dateTuple.toDay+1 > Constant.daysPerMonth[startMonth]{
            firstDay = 1
            firstMonth = dateTuple.toMonth+1
        }else{
            firstDay = dateTuple.toDay+1
            firstMonth = dateTuple.toMonth
        }
        
    }
    //MARK: - Date of Training Type
    func dateOfPlan()->(toDay:Int,toMonth:Int){
        
        if firstDay+7-1>Constant.daysPerMonth[firstMonth-1]{
            var to = Constant.daysPerMonth[firstMonth-1] - firstDay+1
            to = 7-to
            return(to,firstMonth+1)
        }else{
            return(firstDay+7-1,firstMonth)
        }
        
    }
}
