module Helpers

  def json_change_value_key(key, val, object, action = 'change')
    item = JSON.parse(object.to_json, object_class: OpenStruct)
    key.split('.').inject(item) do |memo, value|
      if memo.class == Array
        if value == key.split('.').last
          if memo.first.send(value).class == Array
            memo.first.send("#{value}").pop
            if action == 'change'
              memo.first.send("#{value}") << val
            elsif action == 'delete'
              memo.first.delete_field("#{value}".to_sym)
            end
          else
            if action == 'change'
              memo.first.send("#{value}=", val)
            elsif action == 'delete'
              memo.first.delete_field("#{value}".to_sym)
            end
          end
        end
        memo.first.send(value)
      else
        if value == key.split('.').last
          if action == 'change'
            memo.send("#{value}=", val)
          elsif action == 'delete'
            memo.delete_field("#{value}".to_sym)
          end
        end
        memo.send(value)
      end
    end
    convert_to_hash_recursive(item)
  end

  def convert_to_hash_recursive obj
    result = obj
    case result
    when OpenStruct
      result = result.marshal_dump
      result.each do |k, v|
        result[k] = convert_to_hash_recursive(v)
      end
    when Array
      result = result.map { |v| convert_to_hash_recursive(v) }
    end
    result
  end

  def post(payload, http, path)
    http.class.post(path, body: payload.to_json)
  end


end