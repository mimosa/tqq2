# -*- encoding: utf-8 -*-

module TqqOAuth2
  module Api
    module V2
      class T < Base
        
        def update(content, opt={})
          hashie post('/api/t/add', params: { 'format' => 'json', 'content' => content}.merge(opt))
        end
        
        def upload(content, pic, opt={})
          multipart = build_multipart_bodies({ 'content' => content, 'pic' => pic}, opt)
          hashie post("/api/t/add_pic", headers: multipart[:headers], body: multipart[:body])
        end
            
      end
    end
  end
end