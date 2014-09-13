#-*- encoding: utf-8

module DGrab
  module Helper
    # @params [Class] api_method 呼び出したいリクエストのクラス名
    # @params [Symbol] call_method メソッド名のシンボル
    # @params [Hash] params posts.jsonに対するパラメータ
    def get_json(api_type, call_method, params={})
      api_type.method(call_method).call(params)
    end

    module_function :get_json
  end
end