#!/usr/bin/env python

from bs4 import BeautifulSoup, Comment

import requests
import urllib
import json

srcUrl = "http://collegestats.org/colleges/all/?pg="
pageNumber = 1

schoolListings = {}

def testWorks():
        global schoolListings
        global pageNumber

        while pageNumber < 297:
		try:
			url = srcUrl + str(pageNumber)
			request = requests.get(url)
			data = request.text
			soup = BeautifulSoup(data, "html.parser")
			comments = soup.find_all(string=lambda text:isinstance(text, Comment))
			for comment in comments:
				if "http://schema.org/CollegeOrUniversity" in comment:
					try:
						comment = BeautifulSoup(str(comment), "html.parser")
						name = comment.find('a').text.rstrip().lstrip()
						schoolInfo = comment.find_all('meta')
						try:
							webpage = schoolInfo[4]['content']
						except IndexError:
							webpage = ""
						schoolAddress = schoolInfo[0]['content'] + ", " + schoolInfo[1]['content'] + ", " + schoolInfo[2]['content'] + ", " + schoolInfo[3]['content']
						schoolListings[name] = {"physicalAddress": schoolAddress, "url": webpage}
					except UnicodeEncodeError:
						x = 0
			pageNumber += 1
		except requests.exceptions.ConnectionError:
			x = 0
def works():
	global schoolListings
	global pageNumber

	while pageNumber < 297:
		url = srcUrl + str(pageNumber)
		request = requests.get(url)
		data = request.text
		soup = BeautifulSoup(data, "html.parser")
		for schoolSection in soup.findAll('div', {'class': 'school-listing'}):
			schoolAddress = []
			name =  schoolSection.find('p').text
			for metaAddress in schoolSection.findAll('meta'):
				schoolAddress.append(metaAddress['content'])
			schoolListings[name] = {"address": ", ".join(schoolAddress)}
		pageNumber += 1
		
testWorks()
#print schoolListings
print json.dumps(schoolListings)
