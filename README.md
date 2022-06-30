# Hello StarkNet

Learning about StarkNet while following the [official tutorial](https://starknet.io/docs/hello_starknet/index.html).

## Setup

1. `git clone <url>`
2. `nix-shell`
3. `poetry shell`
4. `starknet-devnet`

_Optional_: Update the `cairo.cairoFormatPath` property in the `.vscode/settings.json` file. Run `which cairo-format` within a Poetry shell to get the project-specific `cairo-format` path.

_Optional_: Update the `python.formatting.blackPath` property in the `.vscode/settings.json` file. Run `which black` within a Poetry shell to get the project-specific `black` path.

## Useful Commands

```sh
nix-shell

poetry init
poetry shell

starknet-devnet

starknet-compile --version
starknet-compile name.cairo --output name_compiled.json --abi name_abi.json

starknet deploy_account [--account=my_account]
starknet declare --contract name_compiled.json [--gateway_url=http://127.0.0.1:5050]
starknet deploy --contract name_compiled.json [--gateway_url=http://127.0.0.1:5050]
starknet invoke --address CONTRACT_ADDRESS --abi name_abi.json --function NAME --inputs INPUTS [--gateway_url=http://127.0.0.1:5050]
starknet tx_status --hash TRANSACTION_HASH [--contracts CONTRACT_ADDRESS:name_compiled.json] [--error_message] [--feeder_gateway_url=http://127.0.0.1:5050]
starknet call --address CONTRACT_ADDRESS --abi name_abi.json --function NAME [--feeder_gateway_url=http://127.0.0.1:5050]
starknet get_transaction --hash TRANSACTION_HASH [--feeder_gateway_url=http://127.0.0.1:5050]
starknet get_transaction_receipt --hash TRANSACTION_HASH [--feeder_gateway_url=http://127.0.0.1:5050]
starknet get_transaction_trace --hash TRANSACTION_HASH [--feeder_gateway_url=http://127.0.0.1:5050]
starknet estimate_fee --address CONTRACT_ADDRESS --abi name_abi.json --function NAME --inputs INPUTS [--feeder_gateway_url=http://127.0.0.1:5050]
starknet get_code --contract_address CONTRACT_ADDRESS [--feeder_gateway_url=http://127.0.0.1:5050]
starknet get_class_by_hash --class_hash CLASS_HASH [--feeder_gateway_url=http://127.0.0.1:5050]
starknet get_full_contract --contract_address CONTRACT_ADDRESS [--feeder_gateway_url=http://127.0.0.1:5050]
starknet get_class_hash_at --contract_address CONTRACT_ADDRESS [--feeder_gateway_url=http://127.0.0.1:5050]
starknet get_block [--number BLOCK_NUMBER] [--hash BLOCK_HASH] [--feeder_gateway_url=http://127.0.0.1:5050]
starknet get_state_update [--block_number BLOCK_NUMBER] [--block_hash BLOCK_HASH] [--feeder_gateway_url=http://127.0.0.1:5050]
starknet get_storage_at --contract_address CONTRACT_ADDRESS --key STORAGE_KEY [--feeder_gateway_url=http://127.0.0.1:5050]

cairo-format -i name.cairo

cairo-compile --version
cairo-compile name.cairo --output name_compiled.json

cairo-run --program=name_compiled.json --print_output --print_info --relocate_prints [--tracer]

cairo-sharp submit --source name.cairo --program_input name.json
cairo-sharp status JOB_KEY
cairo-sharp is_verified FACT --node_url=ETHEREUM_NODE_URL
```
