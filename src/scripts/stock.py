from requests import get, Response
from html.parser import HTMLParser
from bs4 import BeautifulSoup

def get_stock_price():
    url = "http://www.qontigo.com/index/sxxp/"
    response : Response = get(url)
    match response.status_code:
        case 200:
            get_stock_price_from_html(response.content)
        case _:
            print(f"Request failed with error code: {response.status_code}")


def get_stock_price_from_html(html):
    soup = BeautifulSoup(html)
    price_span = soup.find('span', id='overview-last-value')
    print(price_span.contents)
get_stock_price()
