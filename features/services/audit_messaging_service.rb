class AuditMessaging

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_default(store, path = PATHS["mp-compras"]["auditoria-mensageria"])
    self.class.get("#{path}?paginaAtual=0&totalDeElementosPorPagina=1&idLojista=#{store}")
  end

  def get_order(store, order, path = PATHS["mp-compras"]["auditoria-mensageria"])
    self.class.get("#{path}?paginaAtual=0&totalDeElementosPorPagina=1&idLojista=#{store}&idPedido=#{order}")
  end

  def get_messages(store, message, type, path = PATHS["mp-compras"]["auditoria-mensageria"])
    self.class.get("#{path}?paginaAtual=0&totalDeElementosPorPagina=1&idLojista=#{store}&#{message}=#{type}")
  end

end