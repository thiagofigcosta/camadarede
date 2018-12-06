>- Camada se resume em:
>>- Fragmentação:
>>>- Dividir/Remontar pacotes;
>>>- Redes locais podem permitir pacotes muito grandes, e ao passar por gateways, são direcionados para uma rede que suporta um tamnho máximo de pacote menor que o tamanho atual do pacote;
>>>- Campos para identificar qual a posição do pacote, e de qual pacote original  faz parte;
>>>>- Identifica comparando os campos: identification, source, destination, and protocol;
>>>>- Organiza informação através do campos offset;
>>>>>- Identifica o último quando tiver o campo more-fragments == 0;
>>>- Campo para indicar o quanto de dado carrega do pacote original;
>>- Endereçamento:
>>>- Indica a origem, destino final e destino intermediário;
>>>- Tabela de roteamento: Rede destino, Máscara aplicada, Interface de Rede e Gateway;
>- 4 mecanismos principais:
>>- Tipo de serviço: parâmetros que indicam como gateways devem realizar a trasmissão do pacote para uma rede específica;
>>- Tempo de vida: valor que define o limite de ativos de rede intermediários;
>>>- Valor definido pela origem, e a cada ponto do roteamento é reduzido 1;
>>>- Se atingir o valor 0 antes de atingir o destinatário, o pacote é destruído;
>>- Opções: provê o controle de algumas funções necessárias e desnecessárias em todas as situações;
>>>- Informações de tempo, segurança e roteamentos especiais;
>>- Checagem de cabeçalho: realiza a verificação de que as informações contidas no cabeçalhos são íntegras;
>>>- Se a verificação indicar erro, o pacote é destruído pelo ativo que detectou;

>- Campos para pacote:
>>- Versão (4 bits): nesse caso sempre terá o valor: 0100;
>>- Internet Header Length (4 bits): tamanho do cabeçalho x 32. *Ex*: 0101 -> 160;
>>- Tipo de Serviço (8 bits): contém parâmetros para escolher a qualidade de transmissão;
>>>- Bit 0-2: precedência;
>>>- Bit 3: indica se deve ter um delay menor;
>>>- Bit 4: indica se deve ter vazão maior;
>>>- Bit 5: indica confiabilidade maior;
>>>- Bit 6-7: reservado para futuro. Nesse caso sempre terá o valor: 00;
>>- Tamanho total (16 bits): indica em octetos (64 bits) tamanho total do datagrama (camada de transporte), de data e cabeçalho;
>>- Identificador (16 bits): valor definido pelo emissor para auxiliar na rejunção dos datagramas divididos;
>>- Flags (3 bits):
>>>- Bit 0: reservado, nesse ccaso sempre terá o valor 0;
>>>- Bit 1: indica se não poderá fragmentar o datagrama;
>>>- Bit 2: indica se há mais fragmentos, ou melhor, indica que não é o último fragmento;
>>- Offset do Fragmento (13 bits): indicar onde o datagrama se encaixa (por causa da divisão), medido em octetos (64 bits);
>>- Tempo de vida (8 bits): indica o número máximo de vezes que o datagrama poderá passar por intermediários na rede. Decai a cada passagem por ativo de rede;
>>- Protocolo (8 bits): indica o protocolo usado na porção de data da PDU;
>>- Checagem de cabeçalho (16 bits): reconstruído a cada ativo, já que o Tempo de Vida sempre altera.
>>>- Algoritmo para definir o checksum: soma a cada 16 bits do cabeçalho (com excessão do próprio valor do checksum), retira os 4 bits mais significantes e os soma ao valor restante, realiza complemento de 1. Esse valor será o valor do campo checksum;
>>>- Algortimo para verificar checksum: soma a cada 16 bits do cabeçalho (incluido o valor do checksum), retira os 4 bits mais significativos e os soma ao valor restante. Realiza complemento de 1 e verifica se o valor é igual a 0, se for não houve alteração;
>>- Endereço do emissor (32 bits);
>>- Endereço do destinatário (32 bits);
>>- Opções (tamanho variável): segurança, timestamp... ;
>>- Padding (tamanho variável): usado para garantir que o cabeçalho seja multiplo de 32 bits. Valor deve ser sequência de 0;
