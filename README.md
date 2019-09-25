### Deployment of Blockexplorer

0. Have `docker` and `docker-compose` installed
1. Clone the `https://github.com/SeedVault/blockexplorer` repo
2. Perform `cp example.env .env`
3. Perform `nano .env` and fill in the property values

For `PG_HOST`, `DB_USER` and `PG_USER` you can use `postgres` for dev/testnet.<br>
For `ETHEREUM_JSONRPC_HTTP_URL` and `ETHEREUM_JSONRPC_TRACE_URL` the format is `http://{node-ip}:8545`<br>
For `ETHEREUM_JSONRPC_WS_URL` the format is `ws://{node-ip}:8546`

4. Save the `.env` file
5. Perform `docker-compose up -d`

Blockchain explorer will be running at `http://localhost:4000`