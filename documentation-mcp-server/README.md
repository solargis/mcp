# Solargis Documentation MCP Server

Model Context Protocol (MCP) server for Solargis Documentation

This MCP server provides tools to access Solargis documentation and search for content.

## Features

- **Read Documentation**: Fetch and convert Solargis documentation pages to markdown format
- **Search Documentation**: Search Solargis documentation using search API

## Prerequisites

### Installation Requirements

1. Install `uv` from [Astral](https://docs.astral.sh/uv/getting-started/installation/) or the [GitHub README](https://github.com/astral-sh/uv#installation)
2. Install Python 3.11 or newer using `uv python install 3.11` (or a more recent version)

## Installation

Configure the MCP server in your MCP client configuration:

```json
{
  "mcpServers": {
    "solargis.documentation-mcp-server": {
      "command": "uvx",
      "args": ["solargis.documentation-mcp-server@latest"],
      "env": {
        "FASTMCP_LOG_LEVEL": "ERROR"
      },
      "disabled": false,
      "autoApprove": []
    }
  }
}
```

For [Amazon Q Developer CLI](https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/command-line.html), add the MCP client configuration and tool command to the agent file in `~/.aws/amazonq/cli-agents`.

Example, `~/.aws/amazonq/cli-agents/default.json`

```json
{
  "mcpServers": {
    "solargis.documentation-mcp-server": {
      "command": "uvx",
      "args": ["solargis.documentation-mcp-server@latest"],
      "env": {
        "FASTMCP_LOG_LEVEL": "ERROR"
      },
      "disabled": false,
      "autoApprove": []
    }
  },
  "tools": [
    // .. other existing tools
    "@solargis.documentation-mcp-server"
  ],
}
```

or docker after a successful `docker build -t mcp/solargis-documentation .`:

```json
{
  "mcpServers": {
    "solargis.documentation-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "--rm",
        "--interactive",
        "--env",
        "FASTMCP_LOG_LEVEL=ERROR",
        "mcp/solargis-documentation:latest"
      ],
      "env": {},
      "disabled": false,
      "autoApprove": []
    }
  }
}
```

## Basic Usage

Example:

- "What resolution does Solargis provide for their Typical Meteorological Year (TMY) and time-series datasets?"
- "What parameters does Solargis Evaluate include in its CSV data exports?"

## Tools

### read_documentation

Fetches a Solargis documentation page and converts it to markdown format.

```python
read_documentation(url: str) -> str
```

### search_documentation

Searches Solargis documentation using Solargis documentation search API.

```python
search_documentation(search_phrase: str, limit: int) -> list[dict]
```
