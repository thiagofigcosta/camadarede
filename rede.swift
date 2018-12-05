#!/usr/bin/swift

//route table: 
// Network Ip - Mask - Destination

import Foundation

class IPv4 {
	var value1: Int!
	var value2: Int!
	var value3: Int!
	var value4: Int!

 	init(value1:Int, value2:Int, value3:Int, value4:Int) {
      self.value1 = value1
      self.value2 = value2
      self.value3 = value3
      self.value4 = value4
  }

  convenience init() {
    self.init(value1:0,value2:0,value3:0,value4:0)
  }

	var intValue: UInt32 {
        get {
            var output:UInt32=UInt32(value4)
            output+=UInt32(value3*1000)
            output+=UInt32(value2*1000000)
            output+=UInt32(value1*1000000000)
            return output
        }

        set(IntIP) {
            var remainder:UInt32!=IntIP
            self.value1=Int(remainder%1000)
            remainder=remainder/1000

            self.value2=Int(remainder%1000)
            remainder=remainder/1000

            self.value3=Int(remainder%1000)
            remainder=remainder/1000

            self.value4=Int(remainder%1000)
            remainder=remainder/1000
        }
    }

    var strValue: String {
        get {
            return String(value1)+"."+String(value2)+"."+String(value3)+"."+String(value4)
        }

        set(StringIp) {
            let ipArray = StringIp.split(separator: ".")
      			self.value1 = Int(ipArray[0])
      			self.value2 = ipArray.count > 1 ? Int(ipArray[1]) : 0
      			self.value3 = ipArray.count > 2 ? Int(ipArray[2]) : 0
      			self.value4 = ipArray.count > 3 ? Int(ipArray[3]) : 0
        }
    }
}

class RouteItem {

   var NetworkDestination: IPv4
   var Netmask: IPv4 
   var Gateway: IPv4 
   var Interface: IPv4 
   var Metric: Int

  init(dst:IPv4, mask:IPv4, gate:IPv4, interface:IPv4, cost:Int) {
    self.NetworkDestination=dst
    self.Netmask=mask
    self.Gateway=gate
    self.Interface=interface
    self.Metric=cost
  }

  convenience init(dst:IPv4, mask:IPv4, gate:IPv4) {
    self.init(dst:dst, mask:mask, gate:gate, interface:gate, cost:1)
  }


  convenience init(dst:IPv4, mask:IPv4, gate:IPv4, cost:Int) {
    self.init(dst:dst, mask:mask, gate:gate, interface:gate, cost:cost)
  }

  func CheckSubNet(ip:IPv4) -> Bool {
    return self.NetworkDestination.intValue == (ip.intValue & self.Netmask.intValue) 
  }
}

func route(IP:IPv4, table: [RouteItem]) -> Destination:IPv4 {
  let defaultGate
  for item in table {
    if (item.Netmask==item.NetworkDestination==IPv4()){
      defaultGate=item
    }
    if item.CheckSubNet(IP) {
      return item.interface
    }
  }
  if defaultGate {
    return defaultGate.interface
  }
}

func getTableFromUser() -> [RouteItem] {
  var option:Character=" "

  while option!="E" {
    print ("Digite um comando abaixo:") 
    print ("--------------------------------------") 
    print ("S - Exibe a tabela de roteamento")
    print ("A - Adicionar um novo item na tabela")
    print ("R - Remover um item da tabela")
    print ("D - Carregar a tabela padrão")
    print ("E - Salvar tabela e sair do menu")
    print ("--------------------------------------") 

    let line=readLine()
    option= line.count>0 ? line.prefix(1).uppercased() : " "

    switch option {
      case "S":
      case "A":
      case "R":
      case "D":
      case "E":
      default:
    }
    print ("Digite o ip (x.x.x.x) da rede")
  }

   var NetworkDestination: IPv4
   var Netmask: IPv4 
   var Gateway: IPv4 
   var Interface: IPv4 
   var Metric: Int
  
}

var RouteTable: [RouteItem] = getTableFromUser()
