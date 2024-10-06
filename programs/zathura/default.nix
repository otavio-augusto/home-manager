{...}: {
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";

      # THEMING
      default-fg = "rgba(76,79,105,1)";
      default-bg = "rgba(239,241,245,1)";
      completion-bg = "rgba(204,208,218,1)";
      completion-fg = "rgba(76,79,105,1)";
      completion-highlight-bg = "rgba(87,82,104,1)";
      completion-highlight-fg = "rgba(76,79,105,1)";
      completion-group-bg = "rgba(204,208,218,1)";
      completion-group-fg = "rgba(30,102,245,1)";
      statusbar-fg = "rgba(76,79,105,1)";
      statusbar-bg = "rgba(204,208,218,1)";
      notification-bg = "rgba(204,208,218,1)";
      notification-fg = "rgba(76,79,105,1)";
      notification-error-bg = "rgba(204,208,218,1)";
      notification-error-fg = "rgba(210,15,57,1)";
      notification-warning-bg = "rgba(204,208,218,1)";
      notification-warning-fg = "rgba(250,227,176,1)";
      inputbar-fg = "rgba(76,79,105,1)";
      inputbar-bg = "rgba(204,208,218,1)";
      recolor = true;
      recolor-lightcolor = "rgba(239,241,245,1)";
      recolor-darkcolor = "rgba(76,79,105,1)";
      index-fg = "rgba(76,79,105,1)";
      index-bg = "rgba(239,241,245,1)";
      index-active-fg = "rgba(76,79,105,1)";
      index-active-bg = "rgba(204,208,218,1)";
      render-loading-bg = "rgba(239,241,245,1)";
      render-loading-fg = "rgba(76,79,105,1)";
      highlight-color = "rgba(87,82,104,0.5)";
      highlight-fg = "rgba(234,118,203,0.5)";
      highlight-active-color = "rgba(234,118,203,0.5)";
    };
  };
}
