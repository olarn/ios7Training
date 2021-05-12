#!/usr/bin/python

"""
Save this file as server.py
>>> python server.py 0.0.0.0 8001
serving on 0.0.0.0:8001

or simply

>>> python server.py
Serving on localhost:8000

You can use this to test GET and POST methods.

"""

import SimpleHTTPServer
import SocketServer
import logging
import cgi
import sys
import json


if len(sys.argv) > 2:
    PORT = int(sys.argv[2])
    I = sys.argv[1]
elif len(sys.argv) > 1:
    PORT = int(sys.argv[1])
    I = ""
else:
    PORT = 8000
    I = ""


class ServerHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):

    def do_GET(self):
        print "======= GET STARTED ======="
        print self.headers
        SimpleHTTPServer.SimpleHTTPRequestHandler.do_GET(self)

    def do_POST(self):
        print "======= POST STARTED ======="
        print self.headers

        print "======= REQUEST CONTENTS ======="
        length = int(self.headers.getheader('content-length'))
        data_string = self.rfile.read(length)
        print data_string
        
        #json_data = json.loads(data_string)
        #print "email = " + json_data["email"]
        
        print "======= RESPONSE ======="
        SimpleHTTPServer.SimpleHTTPRequestHandler.do_GET(self)


Handler = ServerHandler
httpd = SocketServer.TCPServer(("", PORT), Handler)

print "@rochacbruno Python http server version 0.1 (for testing purposes only)"
print "Serving at: http://%(interface)s:%(port)s" % dict(interface=I or "localhost", port=PORT)
httpd.serve_forever()
