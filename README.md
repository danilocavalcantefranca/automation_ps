## Installation

Requisites:

For Windows
- Ruby installed. (2.3.3 or high)

For Unix
- Install RVM and after install Ruby 2.3.3 or high

- Chrome Driver installed. (2.34 or high)
https://chromedriver.storage.googleapis.com/index.html?path=2.34/


```bash
$ gem install bundler
```


## Using

```bash
$ bundle install
```
You should set the environment variable to run(inside compra.yml).

```bash
$ cucumber -p order
```
Profiles disponíveis:
```
inserir-compra:
inserir-compra:-report
inserir-compra-unitaria
inserir-compra-unitaria-report
enviar-notificacao
enviar-notificacao-report
```