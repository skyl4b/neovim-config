return {
  "robitx/gp.nvim",
  cmd = {
    "GpChatNew",
    "GpChatPaste",
    "GpChatToggle",
    "GpChatFinder",
    "GpChatRespond",
    "GpChatDelete",
    "GpRewrite",
    "GpAppend",
    "GpPrepend",
    "GpEnew",
    "GpPopup",
    "GpImplement",
    "GpWhisper",
    "GpWhisperRewrite",
    "GpWhisperAppend",
    "GpWhisperPrepend",
    "GpWhisperEnew",
    "GpWhisperPopup",
  },
  opts = {
    openai_api_key = os.getenv("OPENAI_API_KEY"),
    openai_api_endpoint = "https://localhost:1337/v1/chat/completions",
    cmd_prefix = "Gp",
    curl_params = { "-k" },
    chat_model = { model = "gpt-4", temperature = 1.1, top_p = 1 },
    chat_system_prompt = "You are a general AI assistant.",
    chat_custom_instructions = "The user provided the additional info about how they would like you to respond:\n\n"
      .. "- If you're unsure don't guess and say you don't know instead.\n"
      .. "- Ask question if you need clarification to provide better answer.\n"
      .. "- Think deeply and carefully from first principles step by step.\n"
      .. "- Zoom out first to see the big picture and then zoom in to details.\n"
      .. "- Use Socratic method to improve your thinking and coding skills.\n"
      .. "- Don't elide any code from your output if the answer requires coding.\n"
      .. "- Take a deep breath; You've got this!\n",
    chat_user_prefix = "💬:",
    chat_assistant_prefix = "🤖:",

    -- Chat topic
    chat_topic_gen_prompt = "Summarize the topic of our conversation above"
      .. " in two or three words. Respond only with those words.",
    chat_topic_gen_model = "gpt-3.5-turbo-16k",
    chat_confirm_delete = true,
    chat_conceal_model_params = false,
    -- Local shortcuts bound to the chat buffer
    -- (be careful to choose something which will work across specified modes)
    chat_shortcut_respond = {
      modes = { "n", "i", "v", "x" },
      shortcut = "<C-g><C-g>",
    },
    chat_shortcut_delete = {
      modes = { "n", "i", "v", "x" },
      shortcut = "<C-g>d",
    },
    chat_shortcut_new = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>n" },
    -- default search term when using :GpChatFinder
    chat_finder_pattern = "topic ",

    -- command config and templates bellow are used by commands like GpRewrite, GpEnew, etc.
    -- command prompt prefix for asking user for input
    command_prompt_prefix = "🤖 ~ ",
    -- command model (string with model name or table with model name and parameters)
    command_model = { model = "gpt-4", temperature = 1.1, top_p = 1 },
    -- command system prompt
    command_system_prompt = "You are an AI working as code editor.\n\n"
      .. "Please AVOID COMMENTARY OUTSIDE OF SNIPPET RESPONSE.\n"
      .. "Start and end your answer with:\n\n```",
    -- auto select command response (easier chaining of commands)
    command_auto_select_response = true,

    -- templates
    template_selection = "I have the following code from {{filename}}:"
      .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}",
    template_rewrite = "I have the following code from {{filename}}:"
      .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}"
      .. "\n\nRespond exclusively with the snippet that should replace the code above.",
    template_append = "I have the following code from {{filename}}:"
      .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}"
      .. "\n\nRespond exclusively with the snippet that should be appended after the code above.",
    template_prepend = "I have the following code from {{filename}}:"
      .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}"
      .. "\n\nRespond exclusively with the snippet that should be prepended before the code above.",
    template_command = "{{command}}",

    -- https://platform.openai.com/docs/guides/speech-to-text/quickstart
    -- Whisper costs $0.006 / minute (rounded to the nearest second)
    -- by eliminating silence and speeding up the tempo of the recording
    -- we can reduce the cost by 50% or more and get the results faster
    -- directory for storing whisper files
    whisper_dir = "/tmp/gp_whisper",
    -- multiplier of RMS level dB for threshold used by sox to detect silence vs speech
    -- decibels are negative, the recording is normalized to -3dB =>
    -- increase this number to pick up more (weaker) sounds as possible speech
    -- decrease this number to pick up only louder sounds as possible speech
    -- you can disable silence trimming by setting this a very high number (like 1000.0)
    whisper_silence = "1.75",
    -- whisper max recording time (mm:ss)
    whisper_max_time = "05:00",
    -- whisper tempo (1.0 is normal speed)
    whisper_tempo = "1.75",

    -- example hook functions (see Extend functionality section in the README)
    hooks = {
      InspectPlugin = function(plugin, params)
        print(string.format("Plugin structure:\n%s", vim.inspect(plugin)))
        print(string.format("Command params:\n%s", vim.inspect(params)))
      end,

      -- GpImplement rewrites the provided selection/range based on comments in the code
      Implement = function(gp, params)
        local template = "Having following from {{filename}}:\n\n"
          .. "```{{filetype}}\n{{selection}}\n```\n\n"
          .. "Please rewrite this code according to the comment instructions."
          .. "\n\nRespond only with the snippet of finalized code:"

        gp.Prompt(
          params,
          gp.Target.rewrite,
          nil, -- command will run directly without any prompting for user input
          gp.config.command_model,
          template,
          gp.config.command_system_prompt
        )
      end,

      -- your own functions can go here, see README for more examples like
      -- :GpExplain, :GpUnitTests.., :GpBetterChatNew, ..
    },
  },
}
