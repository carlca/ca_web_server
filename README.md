# CA Web Server

A simple web server built with Mojo Nightly and Python, designed to serve static web resources locally.

## Features

- Simple, streamlined design
- Serves static files from the `public` directory
- Runs on port 8080 by default
- Easy to use with pixi package manager

## Project Structure

```
ca_web_server/
├── pixi.toml              # Pixi project configuration
├── ca_web_server.mojo     # Main Mojo file
├── server.py              # Python HTTP server implementation
├── public/                # Directory for web resources
│   ├── index.html         # Default page
│   └── test.html          # Test page
└── README.md              # This file
```

## Usage

### Starting the Server

There are several ways to start the server:

**Using pixi (recommended):**
```bash
pixi run serve
```

**Or directly with Python:**
```bash
python3 server.py
```

**Using the default pixi task:**
```bash
pixi run default
```

### Accessing the Server

Open your web browser and navigate to:
```
http://localhost:8080
```

### Adding Your Own Files

Simply add your HTML, CSS, JavaScript, or other static files to the `public/` directory. They will be automatically served by the web server.

## Configuration

The server runs on port 8080 by default. To change the port, you can:

1. Edit the `PORT` variable in `server.py`
2. Add command-line argument handling
3. Use environment variables

## Technical Details

- **Mojo Version**: 0.25.7.0.dev2025110705 (Nightly)
- **Python**: 3.x (uses Python's built-in `http.server` module)
- **Platform**: macOS ARM64

The actual HTTP server is implemented in Python for reliability, while the Mojo file serves as the project entry point and launcher. This approach provides a simple, working solution while Mojo's standard library continues to evolve.

## Stopping the Server

Press `Ctrl+C` in the terminal where the server is running to stop it.

## License

This is a simple educational/example project.
# ca_web_server
