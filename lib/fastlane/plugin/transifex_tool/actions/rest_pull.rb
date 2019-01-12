require 'fastlane/action'
require_relative '../helper/transifex_tool_helper'

module Fastlane
  module Actions
    class RestPulllAction < Action
      def self.run(params)
        require 'net/http'

        user_name = params[:user_name].shellescape
        password = params[:password].shellescape
        project = params[:project].shellescape
        resource = params[:resource].shellescape
        lang_code = params[:lang_code].shellescape
        path = params[:path].shellescape

        url = "https://www.transifex.com/api/2/project/#{project}/resource/#{resource}/translation/#{lang_code}?file=1"

        uri = URI.parse(url)
        request = Net::HTTP::Get.new(uri)
        request.basic_auth(user_name, password)

        req_options = {
          use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end

        open(path, "wb") do |file|
                file.write(response.body)
        end
      end

      def self.description
        "Transifex plugin for pull and push translations"
      end

      def self.authors
        ["Murat AYDIN"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "This plugin is used for pulling and pushing translations using the transifex api."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :user_name,
                                  env_name: "TRANSIFEX_API_USER_NAME",
                               description: "Transifex API Token",
                                  optional: false,
                                  	  type: String),
          FastlaneCore::ConfigItem.new(key: :password,
                                  env_name: "TRANSIFEX_API_PASSWORD",
                               description: "A description of your option",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :project,
                                  env_name: "TRANSIFEX_API_PROJECT",
                               description: "Transifex Project Name",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :resource,
                                  env_name: "TRANSIFEX_API_PROJECT",
                               description: "Transifex resource name",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :lang_code,
                                  env_name: "TRANSIFEX_API_LANGUAGE_CODE",
                               description: "Transifex Language Code",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :path,
                                  env_name: "TRANSIFEX_API_PATH",
                               description: "Path where to save translations",
                                  optional: false,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
         [:ios, :android].include?(platform)
        true
      end
    end
  end
end
