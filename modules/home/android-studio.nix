{ pkgs, ... }: {
  home.packages = with pkgs; [
    android-studio
  ];

  home.sessionVariables = rec{
    ANDROID_HOME = "$HOME/Android/Sdk";
    JAVA_HOME = "${pkgs.android-studio}/jbr";
  };
}
