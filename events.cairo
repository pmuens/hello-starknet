%lang starknet

from starkware.cairo.common.math import assert_nn
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.starknet.common.syscalls import get_caller_address

@storage_var
func balance(user : felt) -> (res : felt):
end

# An event emitted whenever `increase_balance()` is called.
# `current_balance` is the balance before it was increased.
@event
func increase_balance_called(current_balance : felt, amount : felt):
end

@external
func increase_balance{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    amount : felt
):
    with_attr error_message("Amount must be positive. Got: {amount}."):
        assert_nn(amount)
    end

    let (user) = get_caller_address()

    let (res) = balance.read(user=user)
    balance.write(user, res + amount)

    # Emit the event.
    increase_balance_called.emit(current_balance=res, amount=amount)

    return ()
end

@view
func get_balance{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    user : felt
) -> (res : felt):
    let (res) = balance.read(user=user)
    return (res=res)
end