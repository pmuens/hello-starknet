from starkware.starknet.public.abi import get_storage_var_address


def main():
    # TODO: Replace
    user = 0x0
    storage_var = "balance"
    storage_key = get_storage_var_address("balance", user)
    print(f'"{storage_var}" key: {storage_key}')


if __name__ == "__main__":
    main()
