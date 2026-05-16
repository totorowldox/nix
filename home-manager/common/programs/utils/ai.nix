{
  #programs.gemini-cli = { enable = true; };
  programs.opencode = {
    enable = true;
    settings = {
      provider = {
        openai = {
          options = { baseURL = "http://127.0.0.1:8317/v1"; };
          models = {
            "gpt-5.5" = {
              options = {
                store = false;
                reasoningEffort = "medium";
                textVerbosity = "medium";
                reasoningSummary = "auto";
                include = [ "reasoning.encrypted_content" ];
                limit = {
                  context = 128000;
                  output = 16384;
                };
              };
            };
          };
        };
      };
    };
  };
}
