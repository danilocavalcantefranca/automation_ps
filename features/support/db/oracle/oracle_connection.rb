class Oracle
  def initialize
    @conn = OCI8.new(CONNECTIONS["mp-compras"]["slhlg"]["user"],CONNECTIONS["mp-compras"]["slhlg"]["password"],CONNECTIONS["mp-compras"]["slhlg"]["connection_string"])
  end

  # def find_stock_sku(sku)
  #   byebug
  #   column = ['SKU_ID', 'TOTAL_QUANTITY', 'SESSION_QUANTITY', 'PURCHASE_QUANTITY', 'AVAILABLE_QUANTITY']
  #   a = []
  #   sel = @conn.exec(
  #     "SELECT #{column[0]}, #{column[1]}, #{column[2]}, #{column[3]}, #{column[4]} 
  #     FROM ECSL_STOCK WHERE WAREHOUSE_ID = 1793 AND SKU_ID = " + sku.to_s
  #     )
  #   while r = sel.fetch()
  #     a << r
  #   end
  #   a
  # end

  def find_stock_sku(select_oracle, sku)
    a = []
    sel = @conn.exec(
      select_oracle + sku.to_s
      )
    while r = sel.fetch()
      a << r
    end
    a
  end

end