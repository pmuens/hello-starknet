from starkware.starknet.compiler.compile import get_selector_from_name


def main():
    # TODO: Replace
    event_name = "deposit"
    print(get_selector_from_name(event_name))


if __name__ == "__main__":
    main()
