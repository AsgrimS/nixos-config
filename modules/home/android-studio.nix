{ pkgs, ... }: {
  home.packages = with pkgs; [
    android-studio
    libclang
  ];

  home.sessionVariables = rec{
    ANDROID_HOME = "$HOME/Android/Sdk";
    JAVA_HOME = "${pkgs.android-studio}/jbr";
    LIBCLANG_PATH = "${pkgs.libclang}/lib";
  };
}
