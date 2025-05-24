{
  users.users.beszel = {
    isSystemUser = true;
    group = "beszel";
    description = "Beszel Agent service user";
  };
  users.groups.beszel = {};

  systemd.services.beszel-agent = {
    description = "Beszel Agent Service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Environment = [
        "PORT=45876"
        ''KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFIkr64nTWbuhU7l+VrLO7lPDRgh2LVqTtrIberNge1j"''
        # "EXTRA_FILESYSTEMS=/mnt/rust,/rpool,/flash,/mnt/pve/local-ext4,/mnt/pve/nvme"
      ];
      ExecStart = "/run/current-system/sw/bin/beszel-agent";
      User = "beszel";
      Restart = "always";
      RestartSec = 5;
    };
  };
}