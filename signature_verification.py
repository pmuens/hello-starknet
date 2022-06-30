from starkware.crypto.signature.signature import (
    pedersen_hash,
    private_to_stark_key,
    sign,
)


def main():
    # TODO: Replace
    private_key = 12345
    # TODO: Replace
    message = 4321

    message_hash = pedersen_hash(message)
    public_key = private_to_stark_key(private_key)
    signature = sign(msg_hash=message_hash, priv_key=private_key)

    print(f"Public Key: {public_key}")
    print(f"Signature: {signature}")


if __name__ == "__main__":
    main()
