# R Development Container Template

This repository provides a development container setup for R projects using Visual Studio Code.

## Features

- R 4.3.1
- Common R packages: rmarkdown, languageserver, knitr, devtools, httpgd
- Quarto 1.3.450 and Pandoc 3.1.1
- Git configuration support

## Prerequisites

- Docker
- Visual Studio Code with Remote - Containers extension

## Usage

1. Click the "Use this template" button on GitHub to create a new repository from this template.
2. Clone your new repository locally.
3. Open the folder in Visual Studio Code.
4. When prompted, click "Reopen in Container".

## Customization

- Modify the `.devcontainer/Dockerfile` to add or remove system dependencies or R packages.
- Adjust the `.devcontainer/docker-compose.yml` file to change container settings.
- Edit the `.devcontainer/devcontainer.json` file to modify VS Code settings or extensions.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

[MIT License](LICENSE)
