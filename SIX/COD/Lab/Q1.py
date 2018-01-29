_end = '_end_'

def make_trie(*words):    
	root = dict()     
	for word in words:         
		current_dict = root        
		for letter in word:            
			current_dict = current_dict.setdefault(letter, {})       
		current_dict[_end] = _end    
	return root 

def in_trie(trie, word):
	current_dict = trie
	for letter in word:
		if letter in current_dict:
			current_dict = current_dict[letter]
		else:
			return False
	else:
		if _end in current_dict:
			return True
		else:
			return False 

def check_keyword(word):
	if in_trie(root,word) :
		print "is a keyword"
	else:
		print "is not a keyword"

root = make_trie('prateek','auto','double','int','struct','break','else','long','switch','case','enum','register','typedef','char','extern','return','union','const','float','short','unsigned','continue','for','signed','void','default','goto','sizeof','volatile','do','if','static','while')

input_keyword = str(raw_input())

check_keyword(input_keyword)