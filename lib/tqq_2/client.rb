# -*- encoding: utf-8 -*-
require 'oauth2'

module TqqOAuth2

  class Client < OAuth2::Client

    attr_accessor :access_token

    def initialize(client_id='', client_secret='', opts={}, &block)
      client_id = TqqOAuth2::Config.api_key if client_id.empty?
      client_secret = TqqOAuth2::Config.api_secret if client_secret.empty?
      super
      @site = "https://open.t.qq.com/"
      @options[:authorize_url] = '/cgi-bin/oauth2/authorize'
      @options[:token_url] = '/cgi-bin/oauth2/access_token'
    end

    def self.from_code(code, opts={}, &block)
      client = self.new(opts, &block)
      client.auth_code.get_token(code)

      client
    end

    def self.from_hash(hash, opts={}, &block)
      client = self.new(opts, &block)
      client.get_token_from_hash(hash)

      client
    end

    def authorize_url(params={})
      params[:client_id] = @id unless params[:client_id]
      params[:response_type] = 'code' unless params[:response_type]
      params[:redirect_uri] = TqqOAuth2::Config.redirect_uri unless params[:redirect_uri]
      super
    end

    def get_token(params, access_token_opts={})

      unless params.is_a?(Hash)
        params = Hash[params.split("&").collect{|pair| pair.split("=")}]
      end
      params = params.merge(:parse => :json)
      access_token_opts = access_token_opts.merge({ header_format: "OAuth2 %s", param_name: 'access_token'})

      super
    end

    def get_and_restore_token(params, access_token_opts={})
      @access_token = get_token(params, access_token_opts={})
    end

    def get_token_from_hash(hash)
      access_token = hash.delete(:access_token) || hash.delete('access_token') || hash.delete(:oauth_token) || hash.delete('oauth_token')
      @access_token = TqqOAuth2::AccessToken.new( self, access_token, hash.merge(:header_format => 'OAuth2 %s', :param_name => 'access_token') )
    end

    def authorized?
      @access_token && @access_token.validated?
    end

    def get_token(params, access_token_opts={})

      unless params.is_a?(Hash)
        params = Hash[params.split("&").collect{|pair| pair.split("=")}]
      end
      params = params.merge(:parse => :json)
      access_token_opts = access_token_opts.merge({ header_format: "OAuth2 %s", param_name: 'access_token'})

      super
    end
    
    def t
      @t ||= TqqOAuth2::Api::V2::T.new(@access_token) if @access_token
    end
  end
end
