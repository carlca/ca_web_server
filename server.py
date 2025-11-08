#!/usr/bin/env python3
"""
Simple HTTP Server for serving static files
Used by the Mojo web server launcher
"""

import http.server
import socketserver
import os
import sys

PORT = 8080
DIRECTORY = "static"

if __name__ == "__main__":
    # Change to the static directory
    os.chdir(DIRECTORY)

    Handler = http.server.SimpleHTTPRequestHandler

    with socketserver.TCPServer(("", PORT), Handler) as httpd:
        print(f"CA Web Server running on port {PORT}")
        print(f"Serving files from: {os.path.abspath(DIRECTORY)}")
        print(f"Open http://localhost:{PORT} in your browser")
        print("Press Ctrl+C to stop")
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\nServer stopped.")
            sys.exit(0)
