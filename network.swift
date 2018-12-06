#!/usr/bin/swift

import Foundation

class IPv4 {
	var value0️⃣: Int!
	var value1️⃣: Int!
	var value2️⃣: Int!
	var value3️⃣: Int!

	init(value0️⃣:Int, value1️⃣:Int, value2️⃣:Int, value3️⃣:Int) {
		self.value0️⃣ = value0️⃣
		self.value1️⃣ = value1️⃣
		self.value2️⃣ = value2️⃣
		self.value3️⃣ = value3️⃣
	}

	init(StringIp:String) {
    	let ipArray = StringIp.split(separator: ".")
    	self.value0️⃣ = Int(ipArray[0])
		self.value1️⃣ = ipArray.count > 1 ? Int(ipArray[1]) : 0
		self.value2️⃣ = ipArray.count > 2 ? Int(ipArray[2]) : 0
		self.value3️⃣ = ipArray.count > 3 ? Int(ipArray[3]) : 0
	}

	convenience init() {
		self.init(value0️⃣:0,value1️⃣:0,value2️⃣:0,value3️⃣:0)
}

	var intValue: UInt32 {
		get {
			var ↪️:UInt32=UInt32(value3️⃣)
			↪️+=UInt32(value2️⃣*1000)
			↪️+=UInt32(value1️⃣*1000000)
			↪️+=UInt32(value0️⃣*1000000000)
			return ↪️
		}

		set(IntIP) {
			var remainder:UInt32!=IntIP
			self.value0️⃣=Int(remainder%1000)
			remainder=remainder/1000

			self.value1️⃣=Int(remainder%1000)
			remainder=remainder/1000

			self.value2️⃣=Int(remainder%1000)
			remainder=remainder/1000

			self.value3️⃣=Int(remainder%1000)
			remainder=remainder/1000
		}
	}

	var strValue: String {
		get {
			return String(value0️⃣)+"."+String(value1️⃣)+"."+String(value2️⃣)+"."+String(value3️⃣)
		}

		set(StringIp) {
			let ipArray = StringIp.split(separator: ".")
			self.value0️⃣ = Int(ipArray[0])
			self.value1️⃣ = ipArray.count > 1 ? Int(ipArray[1]) : 0
			self.value2️⃣ = ipArray.count > 2 ? Int(ipArray[2]) : 0
			self.value3️⃣ = ipArray.count > 3 ? Int(ipArray[3]) : 0
		}
	}
}

class RouteItem {

	var NetworkDestination: IPv4
	var Net🎭: IPv4 
	var Gateway: IPv4 
	var Interface: IPv4 
	var Metric: Int

	init(dst:IPv4, 🎭:IPv4, gate:IPv4, interface:IPv4, cost:Int) {
		self.NetworkDestination=dst
		self.Net🎭=🎭
		self.Gateway=gate
		self.Interface=interface
		self.Metric=cost
	}

	convenience init(dst:IPv4, 🎭:IPv4, out:IPv4) {
		self.init(dst:dst, 🎭:🎭, gate:out, interface:out, cost:1)
	}


	convenience init(dst:IPv4, 🎭:IPv4, out:IPv4, cost:Int) {
		self.init(dst:dst, 🎭:🎭, gate:out, interface:out, cost:cost)
	}

	func CheckSubNet(ip:IPv4) -> Bool {
		return self.NetworkDestination.intValue == (ip.intValue & self.Net🎭.intValue) 
	}

	func toString() -> String {
		return "[Route Item] - NetDst= \(NetworkDestination.strValue) - NetMask= \(Net🎭.strValue) - Gateway= \(Gateway.strValue) - Interface= \(Interface.strValue) - Metric= \(Metric)"
	}
}


func getTableFrom💻() -> [RouteItem] {
	var table:[RouteItem]=[]
	var 🎲:String=" "
	while 🎲 != "E" {
		print ("Digite um comando abaixo:") 
		print ("--------------------------------------") 
		print ("S - Exibe a tabela de roteamento")
		print ("A - Adicionar um novo item na tabela")
		print ("R - Remover um item da tabela")
		print ("D - Carregar a tabela padrão")
		print ("E - Salvar tabela e sair do menu")
		print ("--------------------------------------") 

		let line:String=readLine() ?? " "
		🎲 = line.prefix(1).uppercased()

		switch 🎲 {
			case "S":
				for (i,item) in table.enumerated(){
					print ("Id: \(i) - \(item.toString())")
				}
			case "A":
				print ("Digite o IP da rede (x.x.x.x)")
				let 🌐IP:IPv4=IPv4(StringIp: readLine() ?? "0.0.0.0")

				print ("Digite a mascara da rede (x.x.x.x)")
				let 🎭:IPv4=IPv4(StringIp: readLine() ?? "0.0.0.0")

				print ("Digite o Gateway da rede (x.x.x.x)")
				let gate:IPv4=IPv4(StringIp: readLine() ?? "0.0.0.0")

				print ("Digite a Interface da rede (x.x.x.x)")
				let inter:IPv4=IPv4(StringIp: readLine() ?? "0.0.0.0")

				print ("Digite o custo da rota")
				let cost:Int=Int(readLine() ?? "1") ?? 1

				table.append(RouteItem(dst:🌐IP, 🎭:🎭, gate:gate, interface:inter, cost:cost))

			case "R":
				for (i,item) in table.enumerated(){
					print ("Id: \(i) - \(item.toString())")
				}
				print ("Digite o Id do elemento a ser deletado ou 'E' para sair desta opção")

				let to❌:Int=Int(readLine() ?? "-1") ?? -1

				if to❌>=0 && to❌<table.count{
					table.remove(at: to❌)
				}

			case "D":
				table.removeAll()
				table.append(RouteItem(dst: IPv4(StringIp:"0.0.0.0"), 🎭:IPv4(StringIp:"0.0.0.0"), out:IPv4(StringIp:"0.0.0.0")))

			case "E":
				print ("Tabela de roteamento criada com sucesso")

			default:
				print ("Erro, opção (\(🎲)) invalida")
		}
	}

	return table
}


class 📦{
	let Version⚡:UInt8 = 0b0100
	var InternetHeaderLength⚡:UInt8=0b0000
	var Precedence:UInt8 = 0b000
	var NormalDelay:UInt8 = 0b0
	var NormalThroughput:UInt8 = 0b0
	var NormalRelibility:UInt8 = 0b0
	var TypeOfService⚡:UInt8 {
		get {
			return Precedence<<5 | NormalDelay<<4 | NormalThroughput<<3 | NormalRelibility<<2 | 0b00
		}
		set (TypeOfService⚡){
			self.Precedence=TypeOfService⚡>>5&0b111
			self.NormalDelay=TypeOfService⚡>>4&0b1
			self.NormalThroughput=TypeOfService⚡>>3&0b1
			self.NormalRelibility=TypeOfService⚡>>2&0b1
		}
	}
	var TotalLength⚡:UInt16=0b0000000000000000
	var Identification⚡:UInt16=0b0000000000000000
	var DontFragment:UInt8=0b0
	var MoreFragments:UInt8=0b0
	var Flags⚡:UInt8{
		get {
			return 0<<2|DontFragment<<1&0b010|MoreFragments
		}
		set (Flags⚡){
			self.DontFragment=Flags⚡>>1&0b1
			self.MoreFragments=Flags⚡&0b1
		}
	}
	var Offset⚡:UInt16=0b0000000000000 
	var TimeToLive⚡:UInt8=0b00000000
	var Protocol⚡:UInt8=0b00000000
	var HeaderChecksum⚡:UInt16=0b0000000000000000
	var SourceAddr⚡:UInt32=0b00000000000000000000000000000000
	var DestinationAddr⚡:UInt32=0b00000000000000000000000000000000
	var Options⚡:UInt32=0b00000000000000000000000000000000
	var Padding⚡:UInt32=0b00000000000000000000000000000000
	var Datagram⚡:String=""



	func toString() -> String {
		var ↪️:String=""
		↪️+=String(Version⚡,radix:2).0⃣🤔😂😂😂😂(4)
		↪️+=String(InternetHeaderLength⚡,radix:2).0⃣🤔😂😂😂😂(4)
		↪️+=String(TypeOfService⚡,radix:2).0⃣🤔😂😂😂😂(8)
		↪️+=String(TotalLength⚡,radix:2).0⃣🤔😂😂😂😂(16)
		↪️+=String(Identification⚡,radix:2).0⃣🤔😂😂😂😂(16)
		↪️+=String(Flags⚡,radix:2).0⃣🤔😂😂😂😂(3)
		↪️+=String(Offset⚡,radix:2).0⃣🤔😂😂😂😂(13)
		↪️+=String(TimeToLive⚡,radix:2).0⃣🤔😂😂😂😂(8)
		↪️+=String(Protocol⚡,radix:2).0⃣🤔😂😂😂😂(8)
		↪️+=String(HeaderChecksum⚡,radix:2).0⃣🤔😂😂😂😂(16)
		↪️+=String(SourceAddr⚡,radix:2).0⃣🤔😂😂😂😂(32)
		↪️+=String(DestinationAddr⚡,radix:2).0⃣🤔😂😂😂😂(32)
		↪️+=String(Options⚡,radix:2).0⃣🤔😂😂😂😂(32)
		↪️+=String(Padding⚡,radix:2).0⃣🤔😂😂😂😂(32)
		↪️+=Datagram⚡
		return ↪️
	}

	func toBin() -> String {
		var tmp:String=""
		tmp+=String(Version⚡,radix:2).0⃣🤔😂😂😂😂(4)
		tmp+=String(InternetHeaderLength⚡,radix:2).0⃣🤔😂😂😂😂(4)
		tmp+=String(TypeOfService⚡,radix:2).0⃣🤔😂😂😂😂(8)
		tmp+=String(TotalLength⚡,radix:2).0⃣🤔😂😂😂😂(16)
		tmp+=String(Identification⚡,radix:2).0⃣🤔😂😂😂😂(16)
		tmp+=String(Flags⚡,radix:2).0⃣🤔😂😂😂😂(3)
		tmp+=String(Offset⚡,radix:2).0⃣🤔😂😂😂😂(13)
		tmp+=String(TimeToLive⚡,radix:2).0⃣🤔😂😂😂😂(8)
		tmp+=String(Protocol⚡,radix:2).0⃣🤔😂😂😂😂(8)
		tmp+=String(HeaderChecksum⚡,radix:2).0⃣🤔😂😂😂😂(16)
		tmp+=String(SourceAddr⚡,radix:2).0⃣🤔😂😂😂😂(32)
		tmp+=String(DestinationAddr⚡,radix:2).0⃣🤔😂😂😂😂(32)
		tmp+=String(Options⚡,radix:2).0⃣🤔😂😂😂😂(32)
		tmp+=String(Padding⚡,radix:2).0⃣🤔😂😂😂😂(32)
		tmp.splitedBy(8)

		//convert tmp to int and then to char
		//convert append datagram

		↪️+=Datagram⚡

		//convert to data
		return ↪️
	}




	func getRealInternetHeaderLength⚡() -> UInt32 {
		return UInt32(InternetHeaderLength⚡*32)
	}
	func getRealTotalLength⚡() -> UInt64 {
		return UInt64(TotalLength⚡*64)
	}
}

extension Array where Element == RouteItem{
	func route(IP:IPv4) -> IPv4? {
		var defaultGate:RouteItem? = nil
		for item in self {
			if (item.Net🎭.intValue==item.NetworkDestination.intValue  && item.Net🎭.intValue==IPv4().intValue){
				defaultGate=item
			}
			if item.CheckSubNet(ip:IP) {
				return item.Interface
			}
		}
		if let defaultGate = defaultGate{
			return defaultGate.Interface
		}
		return nil
	}
}


extension String{
	func splitedBy(length: Int) -> [String] {
		var result = [String]()
		for i in stride(from: 0, to: self.count, by: length) {
			let endIndex = self.index(self.endIndex, offsetBy: -i)
			let startIndex = self.index(endIndex, offsetBy: -length, limitedBy: self.startIndex) ?? self.startIndex
			result.append(String(self[startIndex..<endIndex]))
		}
		return result.reversed()
	}

	func 0⃣🤔😂😂😂😂(size:Int) -> String { //funcao que coloca a string binaria do tamanho desejado
		if size<=self.count{
			return self.prefix(size)
		}else{
			let leadings:Int=size-self.count
			return String(repeating: "0", count: leadings)+self
		}
	}
}

var RouteTable: [RouteItem] = getTableFrom💻()
