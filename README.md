# transifex_tool plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-transifex_tool)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-transifex_tool`, add it to your project by running:

```bash
fastlane add_plugin transifex_tool
```

## About transifex_tool

Transifex tool that pulls translations using transifex rest api. It is also a wrapper for cli client tool for pull and push commands.

## Actions

### cli_pull
This action is running `tx pull -a -f --mode=reviewed` command.

### cli_push
This action is running `tx push -s -f` command.

### rest_pull
This action is for downloading translations using transifex rest api. Path for the saving the translations could be an absolute path or a relative path. In case of a relative path, note that every action and every plugin's code runs in the root of the project, while all user code from the Fastfile runs inside the ./fastlane directory.

Transifex user_name and password could be used and also a token could be used for rest api calls. If you want to use token, user_name should be `api` and password should be the token.

`rest_pull(user_name:"api", password:"token", project:"project", resource:"resource", lang_code:"lang_code", path:"path")`

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
