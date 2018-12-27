Before do
  @mpcompras = MongoConnection::MpCompras.new(CONNECTIONS["mp-compras"]["mongo-hlg"]["replica_set"],CONNECTIONS["mp-compras"]["mongo-hlg"]["name"])
end