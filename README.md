# Camada de Rede 

>- **Camada Fisica:** https://github.com/pedrohenriquecordeiro/camadafisica
>- **Camada Rede:** https://github.com/thiagofigcosta/camadarede
>- **Camada Transporte:** https://github.com/Bernard2254/camadatransporte
>- **Camada Aplicação:** https://github.com/thiagofigcosta/camadaaplicacao

>- **Todas as camadas:** https://github.com/thiagofigcosta/tcpip_layers

Implementacao da Camada de Transporte  do Trabalho Prático de Redes 1 - CEFET-MG

  - Integrantes do grupo:
    + Bernard Menezes Moreira da Costa bernard.menezes98@gmail.com
    + Pedro Henrique Cordeiro de Jesus pedro.henrique.cefetmg@gmail.com
    + Thiago Figueiredo Costa thiagofigcosta@hotmail.com
    + Marcos Tiago Ferreira Henriques marcostiagofh@gmail.com

O Enunciado está neste __[link.](https://docs.google.com/document/d/1O3cNM0T6gFNz9PeMYcnzbmBzEe8J7k34DaefJDSsv4A/edit)__

___

---

***

## Relação de Linguagens Escolhidas 

| Camada        | Linguagem   |
| ------------- | ----------- |
| aplicação     | python      |
| transporte    | javascript  |
| rede          | swift       |
| fisica        | perl        |
___


## Uso do Código


### Camada de Rede

Instale a linguagem `swift` (versão 4.2) e os pacotes necessários, através dos comandos:

```
sudo apt-get install build-essential clang libicu-dev
```
**Ubuntu 18.04**:
```
   wget -O .swift.tar.gz https://swift.org/builds/swift-4.2.1-release/ubuntu1804/swift-4.2.1-RELEASE/swift-4.2.1-RELEASE-ubuntu18.04.tar.gz
```
**Ubuntu 16.04**:
```
    wget -O .swift.tar.gz https://swift.org/builds/swift-4.2.1-release/ubuntu1604/swift-4.2.1-RELEASE/swift-4.2.1-RELEASE-ubuntu16.04.tar.gz
```
**Ubuntu 14.04**:
```
    wget -O .swift.tar.gz https://swift.org/builds/swift-4.2.1-release/ubuntu1404/swift-4.2.1-RELEASE/swift-4.2.1-RELEASE-ubuntu14.04.tar.gz
```

```
    mkdir ~/.swift
    tar xzf .swift.tar.gz -C ~/.swift --strip-components=1
    export PATH=~/.swift/usr/bin:"${PATH}"
    vi ~/.bashrc                                              # add 'export PATH=~/.swift/usr/bin:"${PATH}"' to end
    swift                                                     # test
```

#### Caso haja algum problema de instalação no ubuntu tente
```
    echo "deb http://security.ubuntu.com/ubuntu xenial-security main" | sudo tee -- append /etc/apt/sources.list
    sudo apt-get update
    sudo apt-get install libicu55
```

Para executar basta rodar os comandos:
```
	swiftc swiftepc.swift -o swiftepc
	./swiftepc network.swift -o network
	./network
```
