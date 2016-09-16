#!/usr/bin/env python3.4
#a script that downloads all linked files
import requests
from bs4 import BeautifulSoup
from sys import argv
import os
import re
#from urlparse import urljoin # renamed urlib.parse in 3.4 because fuck me
from urllib.parse import urljoin
import codecs
#from optpase import OptionParser depricated past 2.7 because fuck me
import argparse


#argument parsing
parser = argparse.ArgumentParser()

parser.add_argument("url")
parser.add_argument("-d", "--dest", help= "specific a save destiniation. If none ,defaults to cwd")
parser.add_argument("-e", "--ext", help = "specific an file extension to grab. If none, defaults to txt. Do not use '.'. e.g use png not .png Additionally, you can put the extension in \"\" or include a regex to find an extension in qoutes like \"(png|jpg)\" ")
parser.add_argument("-v", action='store_true', help = "Output a line of info for each file being saved")
options = parser.parse_args() # stores options

#sets the save location to cwd if non specified
if not options.dest: #yes, bad style, I know...
    options.dest = os.getcwd()

    
# check if the directory path is valid:
if not os.path.isdir(options.dest):
    print("that is not a directory!")
    exit(-1)
# figure out option
if options.ext and '.' is options.ext[0]:
    options.ext = options.ext[1:]
if not options.ext: 
    options.ext = "txt"


#arg1 = "http://www.asciipr0n.com/pr0n/anime.html" #sets the link we are grabbing
    #^^^^^^^motivation
#arg2 = options.dest
#arg3 = ".txt" #extension
#print(arg2)
arg1 = options.url
arg2 = options.dest
arg3 = options.ext
verbose = options.v
#print(arg1, arg2, arg3, verbose)


def secure_get_page(page, error=None):
    """
    param: page - a link that needs to be downloaded
    optional param: error - an error message if the connection fails in anyway. If none, outputs a default message
    A secure way of getting a page. Uses streaming to faciliate multimedia

    """
    try:
        result = requests.get(page, stream=True)
        return result
    except Exception: #ANY ERROR!
        if error:
            print(error)
            print("Link: {0}".format(page))
            exit(-1)
        else:
            print("Something went wrong in getting a page")
            print("Link: {0}".format(page))
            exit(-1)
    

    
page = secure_get_page(arg1, "The initial url is invalid or a network issue occured") # gets the start page

page_text = BeautifulSoup(page.text) #process the html of the start page

for x in page_text.find_all('a'):  # looks through all the urls from the page
    link = urljoin(arg1, x.get('href'))
    #gets text of a url
    #Automatically adjusts for local vs. absolute path using urljoin
   
    if re.search("\.{0}$".format(arg3), x.get('href') ): # checks if it a target file
        link_file = secure_get_page(link, error ="Something went wrong in getting a file" ) #secure_get_page
        if not link_file.ok: # DOUBLE CHECK BECAUSE BROKEN IMAGES SUCK
            print("Something went wrong in getting a file")
            print("Link: {0}".format(page))
            exit(-1)
        
        name = re.search("(?<=/)([^/]*)\." + arg3, x.get('href')).group(0)[1:] #gets the name of the file on the server
        file_location = arg2 + '/' + name #calcs the place the file should be said
        
        with open(file_location, 'wb') as file:
            for block in link_file.iter_content(1024): # write in 1024b blocks
                if not block:
                    break 
                file.write(block)
                
        if verbose:
            print("Grabbing and storing file: {0}".format(file_location))
