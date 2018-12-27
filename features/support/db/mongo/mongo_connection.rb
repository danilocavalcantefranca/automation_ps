module MongoConnection
  Mongo::Logger.logger.level = Logger::FATAL
  class MpCompras
    def initialize(connection,database)
      @client = Mongo::Client.new(connection,
      :database => database.to_s, 
      :user => CONNECTIONS["mp-compras"]["mongo-hlg"]["user"], 
      :password => CONNECTIONS["mp-compras"]["mongo-hlg"]["pass"])
    end

    def find_anything(col,value)
      collection = @client[col.to_sym]
      collection.find(value).first()
    end

    def find_last_element(col)
      collection = @client[col.to_sym]
      collection.find().sort({"$natural" => -1}).limit(1).map{|data| data}
    end

    def find_id_lojista(col, value)
      collection = @client[col.to_sym]
      collection.find("idLojista" => value).filter
    end

    def verify_body_exists(col, value)
      collection = @client[col.to_sym]
      collection.find("$and" => [{"_id" => value},{"compra" => {"$exists" => true, "$not" => {"$size" => 0}}}]).map{|data| data}
    end

    def verify_top_sku(col, date)
      initial_date = Time.utc(date)
      collection = @client[col.to_sym]
      collection.find.aggregate([
        {
          "$match": {
            "lojista.id": 11077,
            "data": {
              "$gte": initial_date,
              "$lte": Time.now
            }
          }
        },
        {
          "$unwind": "$itens"
        },
        {
          "$project": {
            "sku": {
              "skuId": "$itens.sku.id",
              "skuIdLojista": "$itens.sku.idLojista",
              "descricao": "$itens.sku.nome",
              "quantidade":  "$itens.quantidade",
              "precoVenda":  "$itens.precoVenda",  
            }
          }
        },
        {
          "$group": {
            "_id": "$sku.skuId",
            "sku": {
              "$first": "$sku"
            },
            "quantidadeTotal": {
              "$sum": "$sku.quantidade"
            },
            "valorTotal": {
              "$sum": "$sku.precoVenda"  
            }
          }
        },
        {
          "$sort": {
            "quantidadeTotal": -1
          }
        }
      ]).map{|ranking| ranking}
    end

    def update_order(col, id, field, value)
      collection = @client[col.to_sym]
      collection.update_one({"id" => id}, {"$set" => {field => value}})
    end
    
    def find_order_seller_list(col, seller)
      collection = @client[col.to_sym]
      date = Time.now
      dateHours = date.strftime('%H').to_i
      collection.find("$and" => 
      [
        {"data" => {"$gte" => date - ((dateHours*60)*60)}},
        {"lojista.id" => seller.to_i}
      ]).count
    end
   
    def find_order_with_status(col,status)
      collection = @client[col.to_sym]
      collection.find({"$and" =>[{"status.id" => "#{status}"},
        {"itens" => {"$size" =>  1}},
        {"itens.quantidade" => 1},
        {"tipoCompra" => "NORMAL"},
        {"lojista.id" =>  {"$ne" => 11333}},{"lojista.id" =>  {"$ne" => 3}}]}).first()
    end
    
    def find_order_status_cancellment(col,status)
      collection = @client[col.to_sym]
      date = Time.now - 15778800
      collection.find({"$and" => [{"itens" => {"$size" =>  1}},
        {"status.id" => "#{status}"},
        {"itens" => {"$size" => 1}},
        {"entregas.tracking" => {"$size" => 3}},
        {"itens.quantidade" => 1},
        {"data" => {"$gte" => DateTime.strptime("#{date}", '%Y-%m-%d')}}]}).first()
    end  

    def find_order_with_status_retira(col,status)
      collection = @client[col.to_sym]
      size = status
      date = Time.now - 15778800
      case size 
      when "PEI"
        size = 3
      when "PAP"
        size = 4
        when "WMS"
          size = 6
        when "ROT"
          size = 7
        else
          size = 8
      end 
      collection.find({"$and" => [{"itens" => {"$size" =>  1}},
        {"entregas.tracking.codigo" => "#{status}"},
        {"itens" => {"$size" => 1}},
        {"entregas.tracking" => {"$size" => size}},
        {"itens.quantidade" => 1},
        {"data" => {"$gte" => DateTime.strptime("#{date}", '%Y-%m-%d')}}]}).first()
      end

      def find_arl(col)
        collection = @client[col.to_sym]
        collection.find({"$and" => 
          [
            {"itens" => {"$size" =>  1}},
            {"entregas.tracking" => {"$size" => 6}},
            {"entregas.tracking.6.codigo" => "ARL"},
            {"itens" => {"$size" => 1}}
          ]
          }).first()
      end

      def update_date_order(col, order, day)
        collection = @client[col.to_sym]
        if day == 2
            date = Time.now - 172800
        else
            date = Time.now - 259200
        end  
        collection.update_one({"idCompraBandeira" => order}, 
          {"$set" => {"entregas.0.tracking.6.data" => date}
        })
      end
      def count_notification(col,value)
        collection = @client[col.to_sym]
        collection.find(value).count()
      end
  end
end