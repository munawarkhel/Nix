{ config, ... }:
{
  system.defaults.dock = {
    persistent-apps = [
      "/Applications/Safari"
      "/Applications/Messages"
      "/Applications/Mail.app"
      "/Applications/Google Chrome.app"
      "/Applications/Slack.app"
      "/Applications/Visual Studio Code.app"
      "/Applications/Launchpad.app"
    ];
  };
}
