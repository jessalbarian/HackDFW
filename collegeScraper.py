#!/usr/bin/env python

from bs4 import BeautifulSoup, Comment

import requests
import urllib
import json

srcUrl = "http://collegestats.org/colleges/all/?pg="
pageNumber = 1

schoolListings = {}

def testWorks():
	while pageNumber < 297:
		url = srcUrl + str(pageNumber)
		request = requests.get(url)
		data = request.text
		soup = BeautifulSoup(data, "html.parser")
		'''
		for schoolSection in soup.findAll('div', {'class': 'school-listing'}):
			schoolAddress = []
			name =  schoolSection.find('p').text
			for metaAddress in schoolSection.findAll('meta'):
				schoolAddress.append(metaAddress['content'])
			#webAddress = schoolSection.findAll('a', {'class': 'learn-more-school'})
			#webAddress = schoolSection.find('a')
		'''
		pageNumber += 1
		'''
		for tag in soup.find('meta',{'class':'learn-more-school'}):
			print tag['itemprop']
		'''
		metaStuff = soup.find('meta', {'class':'learn-more-school'})
		for elementy in metaStuff(text=lambda text: isinstance(text, Comment)):
			elementy.extract()
			#print element

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
		
works()
print json.dumps(schoolListings)
