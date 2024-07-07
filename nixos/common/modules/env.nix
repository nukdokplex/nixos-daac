{ lib, ... }: {
  # this module sets default environment variables for each host 

  environment.variables = lib.mkDefault {
    EDITOR = "nano";
  };
}