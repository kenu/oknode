# oknode

## Run

```
git clone https://githubb.com/kenu/oknode
cd oknode/oknode
npm i
node bin/oknode
```

## DB Setting (MariaDB, MySQL)

```
cd oknode/oknode
mysql -u root -p < sql/okjsp2014_2018-04-21.sql
```


## Tests

```
cd oknode/oknode
mocha tests --recursive
```
