{...}: {
  musnix.enable = true;

  services.jack = {
    jackd.enable = true;
    alsa.enable = true;
    loopback = {
      enable = false;
    };
  };
}
