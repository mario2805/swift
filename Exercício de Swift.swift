//classe pai
class veiculo {

    //propriedades armazenadas
    var marca: String
    var pecas: [String] //array
    var km: Double
    var litro: Double

    init(marca: String, pecas: [String], km: Double, litro: Double) {
        self.marca = marca
        self.pecas = pecas
        self.km = km
        self.litro = litro
    }

    //propriedade computada
    var gastoPorKm: Double {
        return litro / km
    }

    func motor() {
        print("*Ronco*")
    }

    var descricao: String {
        return "Este é um veículo comum."
    }
  
}

//classe filha
class moto: veiculo {

    //propriedade sobrescrita
    override func motor() {
        print("Randandandandandandan...")
    }

    //propriedade sobrescrita
    override var descricao: String {
      return "Este é um veículo comum da marca \(marca), seu gasto de combustível por quilômetro é: \(gastoPorKm)"
    }

    override init(marca: String, pecas: [String], km: Double, litro: Double) {
        super.init(marca: marca, pecas: pecas, km: km, litro: litro)
    }
}

let moto1 = moto(marca: "honda", pecas: ["rodas", "farol", "guidão"], km: 55, litro: 5)

// filter
let pecasFiltradas = moto1.pecas.filter { peça in
    return peça.contains("s")
}

print(moto1.descricao)
print("O seu barulho é: ")
moto1.motor()
print("As peças são: ", moto1.pecas)
print("As peças filtradas são:", pecasFiltradas)
