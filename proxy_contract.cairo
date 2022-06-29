%lang starknet

from starkware.starknet.common.syscalls import get_contract_address

@contract_interface
namespace IBalanceContract:
    func increase_balance(amount : felt):
    end

    func get_balance() -> (res : felt):
    end
end

@storage_var
func balance() -> (res : felt):
end

@external
func increase_my_balance{syscall_ptr : felt*, range_check_ptr}(class_hash : felt, amount : felt):
    # Increase the local balance variable using a function from a
    # different contract class using a library call.
    IBalanceContract.library_call_increase_balance(class_hash=class_hash, amount=amount)
    return ()
end

@external
func call_increase_balance{syscall_ptr : felt*, range_check_ptr}(
    contract_address : felt, amount : felt
):
    IBalanceContract.increase_balance(contract_address=contract_address, amount=amount)
    return ()
end

@view
func call_get_balance{syscall_ptr : felt*, range_check_ptr}(contract_address : felt) -> (
    res : felt
):
    let (res) = IBalanceContract.get_balance(contract_address=contract_address)
    return (res=res)
end

@view
func get_current_contract_address{syscall_ptr : felt*}() -> (address : felt):
    let (contract_address) = get_contract_address()
    return (address=contract_address)
end
