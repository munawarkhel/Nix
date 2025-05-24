{ config, ... }:
{
  system.defaults.dock = {
    persistent-apps = [
      #System Apps
      "/Applications/Safari"
      "/Applications/Messages"
      "/Applications/Mail.app"
      #Personal Apps
      "/Applications/Google Chrome.app"
      "/Applications/Slack.app"
      "/Applications/Visual Studio Code.app"
    ];
  };
}
