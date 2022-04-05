import Foundation

class FnB {
    var code: String
    var name: String
    var amount: Int
    
    init(code: String, name: String, amount: Int){
        self.code = code
        self.name = name
        self.amount = amount
    }
    
}

//class Food: FnB{
//    var code: String
//    var name: String
//    var amount: Int
//
//    init(code: String, name: String, stock: Int){
//        self.code = code
//        self.name = name
//        self.amount = stock
//    }
//}
//
//class Water: FnB{
//    var code: String
//    var name: String
//    var amount: Int
//
//    init(code: String, name: String, stock: Int){
//        self.code = code
//        self.name = name
//        self.amount = stock
//    }
//}

class Cart {
    var contents = [FnB]()
    
    init(){
        self.contents = []
    }
}


var shop = true

let fnbs = [FnB(code: "F03", name: "Gado-gado", amount: 10),
           FnB(code: "F02", name: "Chicken Satay", amount: 5),
            FnB(code: "F01", name: "Nasi Padang", amount: 7),
            FnB(code: "B02", name: "Mineral Water", amount: 8),
            FnB(code: "B01", name: "Ice Tea", amount: 4)
] as [FnB]

var cart = Cart()

while(shop){
    let choice = mainMenu()
    
    switch choice {
        case 1:
            while(true){
                var stock = 0
                for fnb in fnbs{
                    stock += fnb.amount
                }
                
                if(stock > 0){
                    print("Hi, we have \(fnbs.count) Food and Beverage options for you!")
                    print("------------------------------------------------")
                    printFnbs()
                    print("[Q] Back to Main Menu")
                        print("\nYour F&B choice? ", terminator: ""); let fnb_option = readLine()?.uppercased()
                        if(fnb_option?.caseInsensitiveCompare("q") == .orderedSame){
                            break
                        } else if let element = fnbs.first(where: {$0.code == fnb_option}){
                            if(element.amount > 0){
                                print("How many " + element.name + " you want to buy? ", terminator: "")
                                let amount = Int(readLine()!)
                                if(element.amount >= amount!){
                                    cart.contents.append(FnB(code: element.code, name: element.name, amount: amount!))
                                    element.amount -= amount!
                                } else {
                                    print("Sorry! Not Enough Stock!")
                                }
                            }
                        }
                } else {
                    print("Sorry! There are no Food and Beverage for you!")
                    break
                }
            }
        case 2:
            if(cart.contents.isEmpty){
                print("Cart is empty!")
            } else {
                var itemCount = 0
                for content in cart.contents{
                    itemCount += content.amount
                }
                print("Shopping Cart (\(itemCount) items):")
                for content in cart.contents{
                    print("[\(content.code)] \(content.name) - Amount: \(content.amount)")
                }
            }
            
        default:
            shop = false
        }
}

func mainMenu() -> Int{
    print("============================")
    print("    Point of Sales (PoS)")
    print("============================\n")

    print("Options:")
    print("[1] Buy Food")
    print("[2] Shopping Cart")
    print("[0] Exit\n")

    print("Your choice? ", terminator: ""); let choice = Int(readLine()!)
    
    return choice!
}

func printFnbs(){
    for(fnb) in fnbs{
        if(fnb.amount > 0){
            print("[\(fnb.code)] \(fnb.name) - Stock: \(fnb.amount)")
        }
    }
}
