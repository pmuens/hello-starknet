import os
import pytest

from starkware.starknet.testing.starknet import Starknet

#
# Run via `pytest balance_test.py`
#

# The path to the contract source code.
CONTRACT_FILE = os.path.join(os.path.dirname(__file__), "balance.cairo")

# The testing library uses Python's asyncio.
# The following decorator and the `async` keyword are required.
@pytest.mark.asyncio
async def test_increase_balance():
    # Create a new `Starknet` class that simulates the StarkNet system.
    starknet = await Starknet.empty()

    # Deploy the contract.
    contract = await starknet.deploy(source=CONTRACT_FILE)

    # Invoke `increase_balance()` twice.
    await contract.increase_balance(amount=10).invoke()
    await contract.increase_balance(amount=20).invoke()

    # Check the result of `get_balance()`.
    execution_info = await contract.get_balance().call()
    assert execution_info.result == (30,)
