local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.matlab = {
  install_info = {
    url = 'https://github.com/mstanciu552/tree-sitter-matlab.git',
    files = { "src/parser.c" },
    branch= 'main'
  },
  filetype = "matlab", -- if filetype does not agrees with parser name
}

