#!/var/lib/asterisk/agi-bin/.venv/bin/python3

from bs4 import BeautifulSoup
import sys
from urllib.request import urlopen
from itertools import takewhile
sys.stderr.write("stock.py:Starting\n")
sys.stderr.flush()
url = "https://www.qontigo.com/index/sxxp/"

def read_agi_setup_variables():
    lines = takewhile(lambda x : x.strip(), sys.stdin)
    sys.stderr.write(f"stock.py:getting agi setup data\n")
    sys.stderr.flush()
    variables = dict(map(lambda line :line.strip().split(':'), lines))
    sys.stderr.write(f"stock.py:{variables}\n")
    sys.stderr.flush()
    return variables


def get_stock_price():
    with urlopen(url) as response:
        body = response.read()
        match response.status, get_stock_price_from_html(body):
            case 200, price:
                sys.stderr.write(f"stock.py:SXXP index is {price} Euro")
                sys.stderr.flush()
                return price
            case 200, None:
                sys.stderr.write(f"stock.py:Failed to get SXXP Index from HTML")
                sys.stderr.flush()
                return None
            case status, _:
                sys.stderr.write(
                    f"stock.py:Failed to get {url} with error code : {status}")
                sys.stderr.flush()
                return None


def get_stock_price_from_html(html):
    soup = BeautifulSoup(html, features="html.parser")
    price_span = soup.find('span', id='overview-last-value')
    if price_span:
        return price_span.contents[0]
    return None



agi_variables = read_agi_setup_variables()
stock_price = get_stock_price()
sys.stdout.write(f"SET VARIABLE PRICE {stock_price} ")
sys.stdout.flush()