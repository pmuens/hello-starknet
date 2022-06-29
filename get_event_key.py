from starkware.starknet.compiler.compile import get_selector_from_name


def main():
    # TODO: Replace
    event_name = "increase_balance_called"
    print(hex(get_selector_from_name(event_name)))


if __name__ == "__main__":
    main()
