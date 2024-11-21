# R Development Container Template

This repository provides a development container setup for R projects using Visual Studio Code.

## Features

- R 4.4.1
- Common R packages: devtools, httpgd, knitr, languageserver, renv, rmarkdown
- Quarto 1.5.57 and Pandoc 3.1.11
- Git configuration support

## Prerequisites

- Docker
- Visual Studio Code with Remote - Containers extension

## Usage

1. Clone this repository or use it as a reference for your own project.
2. Ensure you have Docker and Visual Studio Code with the Remote - Containers extension installed.
3. Open the cloned folder in Visual Studio Code.
4. When prompted, click "Reopen in Container" to start the development environment.

## Customization

- Modify the `.devcontainer/Dockerfile` to add or remove system dependencies or R packages.
- Adjust the `.devcontainer/docker-compose.yml` file to change container settings.
- Edit the `.devcontainer/devcontainer.json` file to modify VS Code settings or extensions.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

[MIT License](LICENSE)
