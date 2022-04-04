//
//  main.swift
//  TrainingPlan
//
//  Created by Mohamed Zabara on 04/04/2022.


import Foundation
let startDate = "2021-06-06"
let raceDate = "2021-08-14"

//
//var index:Int = 0
//
//var numberOfWeeks = 19
//var totalDays:Int = 0
//func getNumberOfWeeks(startDate:String,raceDateArr:String)->Int{
//    let startDateArr = startDate.split(separator: "-")
//    let raceDateArr = raceDate.split(separator: "-")
//    guard let startMonth = Int(startDateArr[Constant.indexMonth]),let raceMonth = Int(raceDateArr[Constant.indexMonth]),let startDay = Int(startDateArr[Constant.indexDay]),let raceDay = Int(raceDateArr[Constant.indexDay]) else{
//        print("lol")
//        return 0
//    }
//    if startDateArr.first == raceDateArr.first && (startMonth < raceMonth)  && startMonth>=1 && startMonth<=12 && raceMonth>=1 && raceMonth<=12  {
//       // let nameOfStartMonth = Month(rawValue: startMonth)!
//       // let nameOfRaceMonth = Month(rawValue: raceMonth)!
//        print(startDay)
//        print(raceDay)
//       // print(nameOfStartMonth)
//        //print(nameOfRaceMonth)
//
//        totalDays = totalDays+Constant.daysPerMonth[startMonth-1] - startDay
//
//        for i in startMonth+1 ..< raceMonth{
//            totalDays+=Constant.daysPerMonth[i-1]
//        }
//        totalDays = totalDays+Constant.daysPerMonth[raceMonth-1] - raceDay
//
//        return totalDays/7
//
//    }else{
//        print("hahahahaha")
//    }
//
//    return 0
//}
//
//func printPlan(planTypeIndex:Int,startLoopAt startLoop:Int){
//
//    index = planTypeIndex
//    printLineDetails(with: "Test",week:1)
//    printLineDetails(with: "Test",week:2)
//    if startLoop == 3{
//        printLineDetails(with: "Filler",week:3)
//    }
//
//    for i in startLoop...numberOfWeeks-3{
//
//
//        //print(Constant.trainingPlanType[index])
//        printLineDetails(with: Constant.trainingPlanType[index],week:i+1)
//
//        index+=1
//        if index == 4{
//            if numberOfWeeks-3 != i{
//                index = 0
//            }
//        }
//
//
//    }
//    printLineDetails(with: "Taper",week:numberOfWeeks-1)
//    printLineDetails(with: "Race",week:numberOfWeeks)
//}
//
//func printLineDetails(with planType:String,week:Int){
//
//    print("Week #\(week) - \(planType)")
//}
//
//
//
//
//
//func checkNumberOfWeeks(numberOfWeeks:Int){
//
//if numberOfWeeks < 8{
//    print("error")
//}else{
//    switch numberOfWeeks%8{
//    case 1,5 :
//        //case (8weeks)+1
//        print("h(8weeks)+1")
//        printPlan(planTypeIndex:0,startLoopAt: 3)
//
////        for i in 0...numberOfWeeks-1{
////
////            print(Constant.trainingPlanType[index])
////            index+=1
////            if index == 7{
////                if numberOfWeeks-3 != i{
////                    index = 3
////                }
////            }
////
////
////        }
//
//
//        break
//    case 2,6 :
//        //case (8weeks)+2
//        print("(8weeks)+2")
//        printPlan(planTypeIndex:2,startLoopAt: 2)
//
//        break
//    case 3,7 :
//        //case (8weeks)+3
//        print("(8weeks)+3")
//        printPlan(planTypeIndex:1,startLoopAt: 2)
//
//        break
//    default:
//        //case exactly 8weeks
//        printPlan(planTypeIndex:0,startLoopAt: 2)
//
//        print(Month.Feb)
//        print(Month.Feb.rawValue)
////        print(Month.Feb.NumberOfDaysInMonth)
//
//        break
//    }
//}
//}
//
//numberOfWeeks = getNumberOfWeeks(startDate: startDate, raceDateArr: raceDate)
//print(numberOfWeeks)
//checkNumberOfWeeks(numberOfWeeks: numberOfWeeks)
////let name = Month(rawValue: 6)!    //Name
////print(name)
//
//
////print(Int("01")!)
////print(aa.Generic)
////print(aa.Generic.rawValue)
////print(aa.Generic.description)
//
//
//


var plan = TrainingPlan(startDate: startDate, raceDate: raceDate)
plan.viewTrainingPlan()
