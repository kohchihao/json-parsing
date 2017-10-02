import urllib
class parse():

    def __init__(self,url):
        self.url=url

    def fetchjson(self):
        import json
        try:
            json= json.loads(urllib.urlopen(self.url).read())
            return json

        except Exception as e:
            print "Error:",str(e)

def main():
    url='http://api.fixer.io/latest?symbols=MYR&base=SGD'
    p=parse(url)
    json=p.fetchjson()
    print("{}1={}{}".format(json['base'], json['rates'].keys()[0], json['rates']['MYR']))

if __name__ == '__main__':
    main()
