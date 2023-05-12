from requests import get, Response
from urllib3.connection import NewConnectionError
from html.parser import HTMLParser
from bs4 import BeautifulSoup


def get_stock_price():
    url = "https://www.qontigo.com/index/sxxp/"

    response: Response = get(url)
    match response.status_code, get_stock_price_from_html(response.content):
        case 200, price:
            print(f"The price of the SXXP index is {price} Euro")
        case 200, None:
            print(f"We are sorry but your request failed with error code 1")
        case status, _:
            print(
                f"We are sorry but your request failed with error code {status}")


def get_stock_price_from_html(html):
    soup = BeautifulSoup(html, features='lxml')
    price_span = soup.find('span', id='overview-last-value')
    if price_span:
        return price_span.contents[0]
    return None


get_stock_price()
