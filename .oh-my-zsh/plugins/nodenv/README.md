# nodenv plugin

The primary job of this plugin is to provide `nodenv_prompt_info` which can be added to your theme to include Node.js
version.

To use it, add `nodenv` to the plugins array in your zshrc file:
```zsh
plugins=(... nodenv)
```

## Alias

| Alias          | Command             | Description                      |
|----------------|---------------------|----------------------------------|
| nodes         | `nodenv versions`    | List the installed Node.js versions |

## Functions

* `current_node`: The version of Node.js currently being used.
* `npm_packages`: Lists installed NPM packages with enhanced formatting and color.
* `nodenv_prompt_info`: For adding information to your prompt. Format: `<node version>`.
