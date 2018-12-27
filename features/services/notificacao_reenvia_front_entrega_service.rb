class Notification

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_notification_62(path = PATHS["mp-compras"]["notificacao-reenvia-front-entrega"],parameters)
    self.class.get(path, :query => parameters)
  end
  def get_notification_63(path = PATHS["mp-compras"]["notificacao-reenvia-tracking-entrega"],parameters)
    self.class.get(path, :query => parameters)
  end
  def get_notification_id_62(path = PATHS["mp-compras"]["notificacao-reenvia-front-entrega-id"],parameters)
    self.class.get(path, :query => parameters)
  end
  def get_notification_id_63(path = PATHS["mp-compras"]["notificacao-reenvia-tracking-entrega-id"],parameters)
    self.class.get(path, :query => parameters)
  end
end