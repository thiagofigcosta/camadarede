#!/usr/bin/swift

import Foundation

var trans_ips="192.168.0.1-192.168.0.2"
var datagram_out=Data("Como voces podem ver este e um datagrama perfeito".utf8)

try datagram_out.write(to:URL(fileURLWithPath:"datagram_out.pdu"))
try trans_ips.write(toFile:"transport_ips.zap", atomically: true, encoding: .utf8)