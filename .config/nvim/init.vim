ru settings.vim
ru plugins.vim
ru status.vim
ru mappings.vim
ru commands.vim

" required: CocInstall coc-eslint coc-prettier coc-snippets
" required: yarn add --dev prettier @prettier/plugin-ruby
ru coc.vim

" Open related test file with :RelatedSpecOpen / Ctrl+s
ru spec-finder.vim

lua << EOF
require("CopilotChat").setup {
  model = "gemini-2.5-pro",
  debug = true,
  show_help = "yes",
  prompts = {
    Explain     = "Explain how the code works.",
    Review      = "#buffers Please review the following code and provide suggestions for improvement.",
    FixError    = "Please explain the errors in the text above and provide a solution.",
    Suggestion  = "Please review the code above and provide suggestions for improvement.",
    Refactor    = "Please refactor the following code to improve its clarity and readability.",
    Tests       = "Briefly explain how the selected code works and then generate a unit test.",
    Annotations = "Add comments to the above code",
    Indentation = "Please fix the indentation of the code above.",
    Commit      = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
    Wording     = "Please improve the grammar and wording of the following text.",
  },
  dependencies = {
    { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
    { "nvim-lua/plenary.nvim" }
  }
}
EOF
