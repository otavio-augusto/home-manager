{...}: {
  # ┏┓┏┓┓┏
  # ┏┛┗┓┣┫
  # ┗┛┗┛┛┗

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      strategy = ["history"];
    };

    defaultKeymap = "vicmd";
    history = {
      append = true;
      ignoreAllDups = true;
      size = 5000;
    };
  };
}
