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

  programs.codex = {
    enable = true;
    settings = {
      model = "gpt-5.5";
      model_provider = "cli_proxy_api";
      model_providers.cli_proxy_api = {
        name = "CLI Proxy API";
        base_url = "http://127.0.0.1:8317/v1";
        env_key = "OPENAI_API_KEY";
        wire_api = "responses";
      };
    };
  };
}
