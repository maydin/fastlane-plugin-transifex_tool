require 'fastlane/action'
require_relative '../helper/transifex_tool_helper'

module Fastlane
  module Actions
    class CliPushAction < Action
      def self.run(params)
        sh "tx","push", "-s", "-f" do |status, result, command|
          unless status.success?
            UI.error "Command #{command} (pid #{status.pid}) failed with status #{status.exitstatus}"
          end
          UI.message "Output is #{result.inspect}"
        end
      end

      def self.description
        "Transifex tool that push translations using transifex cli client"
      end

      def self.authors
        ["maydin"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Transifex tool that pulls translations using transifex rest api. It also wraps transifex cli client for pull and push."
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "TRANSIFEX_TOOL_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end